import numpy as np
import matplotlib.pyplot as plt
import scipy as sp
from scipy import special as sps
import pandas as pd


# Defining them constants 

## Masses ##

me = 0.510998 # Mass of electron in [MeV/c^2]
mp = 938.27208943 # Mass of proton in [MeV/c^2]
mn = 939.56542194 # Mass of neutron in [MeV/c^2]

md = 1875.612793 # Mass of Deuterium in [MeV/c^2]
mt = 2808.920906 # Mass of Tritium in [MeV/c^2]
m3 = 2808.391383 # Mass of Helium-3 in [MeV/c^2]
m4 = 3727.379109 # Mass of Helium-4 (Alpha) in [MeV/c^2]
mli6 = 5603.05141 # Mass of Lithium-6 in [MeV/c^2]
mli7 = 6533.833166 # Mass of Lithium-7 in [MeV/c^2]
mbe7 = 6534.184060 # Mass of Beryllium-7 in [MeV/c^2]

amu = 931.494003 # AMU in MeV

Q = mn - mp # in [MeV/c^2]


## Energies ##
Bd = 2.224 # Binding Energy of Deuterium in [MeV]
Bt = 8.50 # Binding Energy of Tritium in [MeV]
B3 = 7.718 # Binding Energy of Helium-3 in [MeV]
B4 = 28.295 # Binding Energy of Helium-4 (Alpha) in [MeV]
Bli7 = 39.2 # Binding Energy of Lithum-7 in [MeV]
Bbe7 = 37.6 # Binding Energy of Beryllium-7 in [MeV]


## Elements ## 
Deut = {"m": md, "Z": 1, "A": 2, "s": 1, "B": Bd}
Trit = {"m": mt, "Z": 1, "A": 3, "s": 1/2, "B": Bt}
He3 = {"m": m3, "Z": 2, "A": 3, "s": 1/2, "B": B3}
He4 = {"m": m4, "Z": 2, "A": 4, "s": 0, "B": B4}
Li7 = {"m": mli7, "Z": 3, "A": 7, "s": 3/2, "B": Bli7}
Be7 = {"m": mbe7, "Z": 4, "A": 7, "s": 3/2, "B": Bbe7}


## General Physical Units ##
G = 6.67e-45 # Gravitational Constant [MeV^-2] 
c = 2.99e10 # Speed of Light [cm/s]
kB = 8.617e-11 # Boltzmann Constant [MeV/Kelvin]
hbar = 6.582e-22 # Reduced Planck constant h/2pi [MeV s]
NA = 6.022e23 # Avogadro's number [# molecules/mole]


## Free Parameters ##
Neff = 3.046 # Number of neutrino flavors [unitless]
tau_n = 880 # Average lifetime of a neutron before decay [s]
eta0 = 6.12e-10 # The present day ratio of baryons to photons [unitless, number density]
h = 3.3683e4 * eta0 # h is the baryon density constant from Kawano; it dictates how rhob evolves.

## Some useful conversions ##

def MeVtoK(T):
    'Converts T in MeV to Kelvin'
    eV = 1/(8.619e-5) # 1 eV/kB to Kelvin
    MeV = eV*1e6 # Converting MeV to eV/kB
    K = MeV # Converting to Kelvin
    return K*T

def K9toMeV(T):
    'Converts T9 to T in MeV.'
    
    K = 8.619e-5 # 1 Kelvin to eV/kB
    K9 = K*1e9 # 10^9 Kelvin in eV/kB
    MeV = K9/1e6 # 10^9 Kelvin in MeV/kB
    return MeV*T

def MeVtoK9(T):
    'Converts T in MeV to 1e9 Kelvin'
    eV = 1/(8.619e-5) # 1 eV/kB to Kelvin
    MeV = eV*1e6 # Converting MeV to eV/kB
    K9 = MeV/1e9 # Converting Kelvin to 10^9 Kelvin
    return K9*T

## Few QOL definitions ##

pi = np.pi

def exp(x):
    return np.exp(x)

def zeta(x):
    return sps.zeta(x)

def delta(x, y):
    return 1 if x == y else 0



#### Main Code #####



# Defining the gaussian-laguerre quadrature integrator 

def gl_integrator(func):

    n = 64 
    roots, weights = sps.roots_laguerre(n)

    integrand = func(roots) * exp(roots) 

    integral = np.dot(integrand, weights)

    return integral


# Defining the functions that return the energy densities and pressure for different components of the early universe

def photon(T): 

    '''
    Returns the photon energy density, pressure 
    and the derivative of the energy density with 
    respect to temperature (evaluated at that temperature)
    at a given temperature (in MeV)
    
    '''

    # energy/mass density
    rho_gamma = (pi**2)/15 * T**4 

    # pressure 
    P_gamma = (1/3) * rho_gamma

    # drho_gamma/dT 
    drhog_dT = (4/T) * rho_gamma

    return rho_gamma, P_gamma, drhog_dT


def electron_positron(T): 
    
    '''
    Returns the electrons/positron energy/mass density, pressure 
    and the derivative of the energy density with 
    respect to temperature (evaluated at that temperature)
    at a given temperature (in MeV)
    
    '''

    # Defining the mass/energy density function's integrand

    def rho_e_integrand(x):

        y = me / T
        dist = np.sqrt(x**2 + y**2)

        integrand = (x**2 * dist) / (exp(dist) + 1)
        return integrand

    # Integrating the integrand and multiplying with the constants 
    rho_e = (2 / pi**2) * T**4 * gl_integrator(rho_e_integrand)

    

    # Defining the pressure function's integrand

    def P_e_integrand(x):

        y = me / T
        dist = np.sqrt(x**2 + y**2)

        integrand = x**4 / (dist * (exp(dist) + 1))
        return integrand 
    
    # Integrating the integrand and multiplying with the constants 
    P_e = (2 / (3 * pi**2)) * T**4 * gl_integrator(P_e_integrand)



    # Defining the drho/dT function's integrand

    def drho_dT_integrand(x): 

        y = me / T
        dist = np.sqrt(x**2 + y**2)

        integrand =  (x**2 * dist**2) / (exp(dist) + 1) * exp(dist) / (exp(dist) + 1)   # wrote in split format to prevent overflow issue
        return integrand 

    # Integrating the integrand and multiplying with the constants 
    drhoe_dT = (2 / pi**2) * T**3 * gl_integrator(drho_dT_integrand)

    return rho_e, P_e, drhoe_dT



def neutrino(Tnu):
    '''
    Returns the energy/mass density and pressure for the 
    neutrinos at a given temperature (in MeV)
    
    ''' 

    Neff = 3.046

    # energy density
    rhoneutrino =7/8*pi**2/15 *Neff* Tnu**4

    # pressure
    Pneutrino = rhoneutrino/3

    return rhoneutrino, Pneutrino


# Obtaining the time as a function of the temperature 

'''
We are taking this approach, where we find the age of the universe as a function of temperature instead of 
finding the temperature as the age of universe, because all our previously defined quantities are a direct function 
of the temperature (not time). 

So it would be better to take temperature as the independent quantity instead of time, and instead 
find the age of the universe as a function of time. 

Additionally we also find the neutrino temperature as a function of the photon temperature. Together we can calculate 
the relationship between the temperatures with time. 

'''


def T_dependence(T, state): 

    t, Tnu = state

    rhoe = electron_positron(T)[0]
    rhonu = neutrino(Tnu)[0]
    rhog = photon(T)[0]

    Pe = electron_positron(T)[1]
    Pnu = neutrino(Tnu)[1]
    Pg = photon(T)[1]

    drhoe_dT = electron_positron(T)[2]
    drhog_dT = photon(T)[2]

    H = np.sqrt(rhoe + rhonu + rhog) * np.sqrt(8*pi*G/3)/hbar

    # rho_rad = rhog + rhoe
    # P_rad = Pg + Pe
    # drho_dT = drhoe_dT + drhog_dT

    rho_rad = rhog + rhoe + rhonu
    P_rad = Pg + Pe + Pnu
    drho_dT = drhoe_dT + drhog_dT + 4*rhonu/T


    dt_dT = - (3 * H * (rho_rad + P_rad))**(-1) * drho_dT 

    dTnu_dT = Tnu / (3 * (rho_rad + P_rad)) * drho_dT

    return [dt_dT, dTnu_dT]


Ti = 1e1   # MeV
Tf = 1e-3  # MeV
n =  1024
T = np.geomspace(Ti,Tf,n)  # MeV
T9 = MeVtoK9(T) 

T_dependence_solution = sp.integrate.solve_ivp(fun = T_dependence, t_span = T[[0,-1]], y0 = [0, Ti], t_eval = T)
t = T_dependence_solution.y[0]
Tnu = T_dependence_solution.y[1]