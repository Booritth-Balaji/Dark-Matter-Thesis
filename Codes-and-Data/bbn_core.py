"""
bbn_core.py — Core BBN temperature-evolution solver.

Extracted from BBN-simple-recreated.ipynb, Section 1.

Main entry point
-----------------
    solve_temperature_evolution(Ti, Tf, n, **overrides)
        → returns (T, t, Tnu) numpy arrays

Any physical constant used by the solver can be overridden via keyword
arguments (see DEFAULT_CONSTANTS for the full list).

Example
-------
    from bbn_core import solve_temperature_evolution, MeVtoK9

    # With default constants
    T, t, Tnu = solve_temperature_evolution()

    # With a custom electron mass
    T, t, Tnu = solve_temperature_evolution(me=0.6)
"""

import numpy as np
from scipy import special as sps
from scipy import integrate as spi


# ═══════════════════════════════════════════════
#  QOL helpers
# ═══════════════════════════════════════════════

pi = np.pi


def exp(x):
    return np.exp(x)


def zeta(x):
    return sps.zeta(x)


def delta(x, y):
    return 1 if x == y else 0


# ═══════════════════════════════════════════════
#  Masses  [MeV/c²]
# ═══════════════════════════════════════════════

me   = 0.510998       # electron
mp   = 938.272013     # proton
mn   = 939.565346     # neutron
md   = 1875.612793    # deuterium
mt   = 2808.920906    # tritium
m3   = 2808.391383    # helium-3
m4   = 3727.379109    # helium-4 (alpha)
mli6 = 5603.05141     # lithium-6
mli7 = 6533.833166    # lithium-7
mbe7 = 6534.184060    # beryllium-7

amu  = 931.494003     # atomic mass unit [MeV]

Q    = mn - mp        # neutron–proton mass difference [MeV/c²]


# ═══════════════════════════════════════════════
#  Binding energies  [MeV]
# ═══════════════════════════════════════════════

Bd   = 2.224          # deuterium
Bt   = 8.50           # tritium
B3   = 7.718          # helium-3
B4   = 28.295         # helium-4 (alpha)
Bli7 = 39.2           # lithium-7
Bbe7 = 37.6           # beryllium-7


# ═══════════════════════════════════════════════
#  Element dictionaries  (for later sections)
# ═══════════════════════════════════════════════

Deut = {"m": md,   "Z": 1, "A": 2, "s": 1,   "B": Bd}
Trit = {"m": mt,   "Z": 1, "A": 3, "s": 1/2, "B": Bt}
He3  = {"m": m3,   "Z": 2, "A": 3, "s": 1/2, "B": B3}
He4  = {"m": m4,   "Z": 2, "A": 4, "s": 0,   "B": B4}
Li7  = {"m": mli7, "Z": 3, "A": 7, "s": 3/2, "B": Bli7}
Be7  = {"m": mbe7, "Z": 4, "A": 7, "s": 3/2, "B": Bbe7}


# ═══════════════════════════════════════════════
#  General physical constants
# ═══════════════════════════════════════════════

G    = 6.67e-45       # gravitational constant  [MeV⁻²]
c    = 2.99e10        # speed of light           [cm/s]
kB   = 8.617e-11      # Boltzmann constant       [MeV/K]
hbar = 6.582e-22      # reduced Planck constant  [MeV·s]
NA   = 6.022e23       # Avogadro number


# ═══════════════════════════════════════════════
#  Free parameters
# ═══════════════════════════════════════════════

Neff  = 3.046         # effective number of neutrino species
tau_n = 880           # neutron lifetime [s]
eta0  = 6.12e-10      # baryon-to-photon ratio (present day)
h_bbn = 3.3683e4 * eta0   # baryon density constant (Kawano)


# ═══════════════════════════════════════════════
#  Unit conversions
# ═══════════════════════════════════════════════

def MeVtoK(T):
    """Convert temperature from MeV to Kelvin."""
    eV  = 1 / (8.619e-5)      # 1 eV/kB → Kelvin
    MeV = eV * 1e6
    return MeV * T


def K9toMeV(T):
    """Convert temperature from 10⁹ K (T9) to MeV."""
    K   = 8.619e-5             # 1 K → eV/kB
    K9  = K * 1e9
    MeV = K9 / 1e6
    return MeV * T


def MeVtoK9(T):
    """Convert temperature from MeV to 10⁹ K (T9)."""
    eV  = 1 / (8.619e-5)
    MeV = eV * 1e6
    K9  = MeV / 1e9
    return K9 * T


# ═══════════════════════════════════════════════
#  Numerical integration
# ═══════════════════════════════════════════════

def gl_integrator(func, n_nodes=64):
    """Gauss–Laguerre quadrature of func(x) * exp(-x) over [0, ∞)."""
    roots, weights = sps.roots_laguerre(n_nodes)
    integrand = func(roots) * exp(roots)
    return np.dot(integrand, weights)


# ═══════════════════════════════════════════════
#  Thermodynamic functions  (module-level, use default constants)
# ═══════════════════════════════════════════════

def photon(T):
    """
    Photon energy density, pressure, and dρ/dT at temperature T [MeV].
    Returns (rho, P, drho_dT).
    """
    rho     = (pi**2 / 15) * T**4
    P       = rho / 3
    drho_dT = (4 / T) * rho
    return rho, P, drho_dT


def electron_positron(T, _me=me):
    """
    Electron/positron energy density, pressure, and dρ/dT at temperature T [MeV].
    Returns (rho, P, drho_dT).
    """
    y = _me / T

    def rho_integrand(x):
        dist = np.sqrt(x**2 + y**2)
        return (x**2 * dist) / (exp(dist) + 1)

    def P_integrand(x):
        dist = np.sqrt(x**2 + y**2)
        return x**4 / (dist * (exp(dist) + 1))

    def drho_dT_integrand(x):
        dist = np.sqrt(x**2 + y**2)
        # split form prevents overflow
        return (x**2 * dist**2) / (exp(dist) + 1) * exp(dist) / (exp(dist) + 1)

    rho     = (2 / pi**2) * T**4 * gl_integrator(rho_integrand)
    P       = (2 / (3 * pi**2)) * T**4 * gl_integrator(P_integrand)
    drho_dT = (2 / pi**2) * T**3 * gl_integrator(drho_dT_integrand)

    return rho, P, drho_dT


def neutrino(Tnu, _Neff=Neff):
    """
    Neutrino energy density and pressure at temperature Tnu [MeV].
    Returns (rho, P).
    """
    rho = (7/8) * (pi**2 / 15) * _Neff * Tnu**4
    P   = rho / 3
    return rho, P


# ═══════════════════════════════════════════════
#  Overridable constants registry
# ═══════════════════════════════════════════════

# Constants that the temperature-evolution solver will accept as
# keyword-argument overrides.  Keys must match the names used above.
DEFAULT_CONSTANTS = dict(
    me   = me,
    G    = G,
    hbar = hbar,
    Neff = Neff,
)


# ═══════════════════════════════════════════════
#  Main solver
# ═══════════════════════════════════════════════

def solve_temperature_evolution(Ti=1e1, Tf=1e-3, n=1024, **overrides):
    """
    Solve the coupled ODEs for the early-universe temperature evolution.

    Integrates dt/dT and dTν/dT from photon temperature Ti down to Tf
    over *n* geometrically spaced temperature points.

    Parameters
    ----------
    Ti : float
        Initial photon temperature [MeV].  Default 10 MeV.
    Tf : float
        Final photon temperature [MeV].  Default 1e-3 MeV.
    n  : int
        Number of temperature grid points.  Default 1024.
    **overrides
        Any key from DEFAULT_CONSTANTS can be overridden, e.g.
            solve_temperature_evolution(me=0.6, Neff=3.0)

    Returns
    -------
    T   : ndarray, shape (n,)   — photon temperature grid [MeV]
    t   : ndarray, shape (n,)   — cosmic time [s]
    Tnu : ndarray, shape (n,)   — neutrino temperature [MeV]
    """

    # ── validate overrides ──
    bad_keys = set(overrides) - set(DEFAULT_CONSTANTS)
    if bad_keys:
        raise ValueError(
            f"Unknown constant(s): {sorted(bad_keys)}. "
            f"Allowed overrides: {sorted(DEFAULT_CONSTANTS)}"
        )

    # ── build local constants (defaults + overrides) ──
    _me   = overrides.get("me",   me)
    _G    = overrides.get("G",    G)
    _hbar = overrides.get("hbar", hbar)
    _Neff = overrides.get("Neff", Neff)

    # ── local physics functions (close over the constants above) ──

    def _photon(T):
        rho     = (pi**2 / 15) * T**4
        P       = rho / 3
        drho_dT = (4 / T) * rho
        return rho, P, drho_dT

    def _electron_positron(T):
        y = _me / T

        def rho_integrand(x):
            dist = np.sqrt(x**2 + y**2)
            return (x**2 * dist) / (exp(dist) + 1)

        def P_integrand(x):
            dist = np.sqrt(x**2 + y**2)
            return x**4 / (dist * (exp(dist) + 1))

        def drho_dT_integrand(x):
            dist = np.sqrt(x**2 + y**2)
            return (x**2 * dist**2) / (exp(dist) + 1) * exp(dist) / (exp(dist) + 1)

        rho     = (2 / pi**2) * T**4 * gl_integrator(rho_integrand)
        P       = (2 / (3 * pi**2)) * T**4 * gl_integrator(P_integrand)
        drho_dT = (2 / pi**2) * T**3 * gl_integrator(drho_dT_integrand)

        return rho, P, drho_dT

    def _neutrino(Tnu):
        rho = (7/8) * (pi**2 / 15) * _Neff * Tnu**4
        P   = rho / 3
        return rho, P

    # ── ODE system ──

    def _T_dependence(T_val, state):
        t_val, Tnu_val = state

        rhog, Pg, drhog_dT   = _photon(T_val)
        rhoe, Pe, drhoe_dT   = _electron_positron(T_val)
        rhonu, _             = _neutrino(Tnu_val)

        H = np.sqrt(rhoe + rhonu + rhog) * np.sqrt(8 * pi * _G / 3) / _hbar

        rho_rad  = rhog + rhoe
        P_rad    = Pg + Pe
        drho_dT  = drhoe_dT + drhog_dT

        dt_dT   = -(3 * H * (rho_rad + P_rad))**(-1) * drho_dT
        dTnu_dT = Tnu_val / (3 * (rho_rad + P_rad)) * drho_dT

        return [dt_dT, dTnu_dT]

    # ── solve ──

    T_arr = np.geomspace(Ti, Tf, n)

    sol = spi.solve_ivp(
        fun    = _T_dependence,
        t_span = T_arr[[0, -1]],
        y0     = [0, Ti],
        t_eval = T_arr,
    )

    return T_arr, sol.y[0], sol.y[1]
