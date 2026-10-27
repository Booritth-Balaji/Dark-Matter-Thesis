# ### IMPORT STATEMENTS ###
import numpy as np
import math
from scipy.special import *
from scipy.optimize import *
from scipy import interpolate
from scipy.integrate import *
import matplotlib
from matplotlib import pyplot as plt
from matplotlib.ticker import LogFormatterSciNotation, LogLocator
import warnings
import os

# ----------------------------------- #
### CONSTANTS ###

## Numbers ##
pi = np.pi
zeta_3 = zeta(3)

## Masses ##
me = 0.510998 # Mass of electron in [MeV/c^2]
mp = 938.272013 # Mass of proton in [MeV/c^2]
mn = 939.565346 # Mass of neutron in [MeV/c^2]
md = 1875.612793 # Mass of Deuterium in [MeV/c^2]
mt = 2808.920906 # Mass of Tritium in [MeV/c^2]
m3 = 2808.391383 # Mass of Helium-3 in [MeV/c^2]
m4 = 3727.379109 # Mass of Helium-4 (Alpha) in [MeV/c^2]
mli6 = 5603.05141 # Mass of Lithium-6 in [MeV/c^2]
mli7 = 6533.833166 # Mass of Lithium-7 in [MeV/c^2]
mbe7 = 6534.184060 # Mass of Beryllium-7 in [MeV/c^2]

# mn_minus_mp = mn - mp # Neutron-Proton Mass Difference in [MeV/c^2]
Q0 = mn - mp # Proton-Neutron Mass Difference in [MeV/c^2]
Q = Q0 # Proton-Neutron Mass Difference in [MeV/c^2]

amu = 931.494003 # AMU in MeV
# q = Q/me # Exponential NSE Mass ratio [unitless]

## Energies ##
Bd = 2.224 # Binding Energy of Deuterium in [MeV]
Bt = 8.50 # Binding Energy of Tritium in [MeV]
B3 = 7.718 # Binding Energy of Helium-3 in [MeV]
B4 = 28.295 # Binding Energy of Helium-4 (Alpha) in [MeV]
Bli7 = 39.2 # Binding Energy of Lithum-7 in [MeV]
Bbe7=37.6 # Binding Energy of Beryllium-7 in [MeV]

## General Physical Units ##
hbar = 6.582e-22 # Reduced Planck constant h/2pi [MeV s]
G = 6.67e-45/hbar**2 # Gravitational Constant in [MeV^-4 s^-2] (= 0.0154)
c = 2.99e10 # Speed of Light [cm/s]
kB = 8.617e-11 # Boltzmann Constant [MeV/Kelvin]
NA = 6.022e23 # Avogadro's number [# molecules/mole]

## Particle Physics Units ##
gA = 1.26 # Axial vector corretion for weak charge nucleon rxns between p and n. [scalar]
GF = 1.1663787e-5*1e-6 # Fermi coupling constant in [MeV^-2]
RadConst = (np.pi**2)/15 # Radiation constant for Radiation pressures [unitless]
v0 = 246 # original Higgs VEV in [GeV]
v = v0 # changed Higgs VEV in [GeV]

## Free Parameters ##
Neff = 3.046 # Number of neutrino flavors [unitless]
# taun = 880 * (v/v0)**4 # Average lifetime of a neutron before decay [s]
η0 = 6.12e-10 # The present day ratio of baryons to photons [unitless, number density]
h = 3.3683e4 * η0 # h is the baryon density constant from Kawano; it dictates how rhob evolves.

# ----------------------------------- #
### USEFUL CONVERSIONS ###
def K9toMeV(T):
    'Converts T9 to T in MeV.'
    
    K = 8.619e-5 # 1 Kelvin to eV/kB
    K9 = K*1e9 # 10^9 Kelvin in eV/kB
    MeV = K9/1e6 # 10^9 Kelvin in MeV/kB
    return MeV*T

def MeVtoK9(T):
    'Converts T in MeV to T9'
    eV = 1/(8.619e-5) # 1 eV/kB to Kelvin
    MeV = eV*1e6 # Converting MeV to eV/kB
    K9 = MeV/1e9 # Converting Kelvin to 10^9 Kelvin
    return K9*T

def MeVtoK(T):
    'Converts T in MeV to Kelvin'
    eV = 1/(8.619e-5) # 1 eV/kB to Kelvin
    MeV = eV*1e6 # Converting MeV to eV/kB
    return MeV*T


### ELECTRON/POSITRON AND PHOTON TEMPERATURES ####

# Equations 18 and 19:
def ElectronPositron(T):
    '''
    Solves for the electron and positron energy density and pressure, 𝜌e and Pe, as a function of temperature. 
    INPUT :
    Tγ in MeV [1xn ndarray]
    
    OUTPUTS : 
    𝜌e [1xn ndarray]
    Pe [1xn ndarray]
    '''

    # GL Quadrature shorthands and initialization
    N = 64
    points, weights = roots_laguerre(N)
    y = points
    x = np.expand_dims(me/T,-1)
    dist = np.sqrt(x**2 + y**2)
    
    rhoe_numerator = y**2 * dist

    rhoe_denominator = np.exp(dist) + 1

    # Have to reweight for GL quadrature
    rhoe_integrand = rhoe_numerator/rhoe_denominator * np.exp(y) 
    
    # Approximates the integral by a finite sum in quadrature
    rhoe_integral = np.dot(rhoe_integrand, weights) 
    
    # Full expression with coefficient
    rhoe = T**4 * (2/pi**2) * rhoe_integral 

    Pe_numerator = y**2
    Pe_denominator = dist * (np.exp(dist) + 1)
    
    # Likewise, weight for GL quadrature
    Pe_integrand = y**2*Pe_numerator/Pe_denominator * np.exp(y) 
    Pe_integral = np.dot(Pe_integrand, weights)

    # Full expression with coefficient
    Pe = T**4 * (2/(3 * pi**2)) * Pe_integral 
    
    # T*Derivative of rhoe with respect to temperature. Specific heat, which is used to compute the derivatives dTnu/dT and dT/dt
    drhoedT_integrand = y**2 * dist**2  * np.exp(dist) /(rhoe_denominator) * np.exp(y)/(rhoe_denominator)
    drhoedT_integral = np.dot(drhoedT_integrand,weights)
    drhoedT = T**4 * (2/pi**2) * drhoedT_integral

    return rhoe, Pe, drhoedT
  
# Equations 11 and 12:
def Photon(T):
    '''
    Solves for the photon energy density and pressure, 𝜌γ, Pγ, as a function of temperature.
    
    INPUT : 
    Tγ in MeV [1xn ndarray]

    OUTPUTS :
    𝜌γ in dynes per cm^3 [1xn ndarray]
    Pγ in [pressure...] [1xn ndarray]
    '''
    
    rhogamma = pi**2/15 * T**4
    Pgamma = rhogamma/3 

    return rhogamma, Pgamma

def Neutrino(Tnu):
        rhoneutrino =7/8*pi**2/15 *Neff* Tnu**4
        Pneutrino = rhoneutrino/3

        return rhoneutrino, Pneutrino

def Friedmann(T,a):
     Tnu = a[0]
     rhog, Pg = Photon(T)
     rhonu,Pnu = Neutrino(Tnu)
     rhoe, Pe,cve = ElectronPositron(T)
     drhodT = (cve+4*rhog)/T
     H = np.sqrt(rhoe + rhonu + rhog) * np.sqrt(8*pi*G/3)
     drhodt = -3*H*(rhoe +rhog + Pe + Pg) # Continuity equation: drho_total/dt
     dtdT = drhodT/drhodt
     dTnudT = -H*Tnu*dtdT

     return [dTnudT,dtdT]


# ========================================================================================================== 


### WEAK RATE CALCULATION ###

# Equations 27 and 28:
def WeakRate(T,Tnu):
    '''
    Solves for the weak rates λnp and  λpn by approximating the integral in quadrature. 
    
    INPUT :
    Tγ in MeV [1xn ndarray]
    Tν in MeV [1xn ndarray]
    
    OUTPUTS : 
    λnp [1xn ndarray]
    λpn [1xn ndarray]
    '''

    taun = 880 * (v/v0)**4 * (Q0/Q)**5 # Average lifetime of a neutron before decay [s]
    q = Q/me

    # The normalization coefficient 
    K = 1/(quad(lambda x: np.sqrt(x**2-1)*x*(q-x)**2, 1, q)[0])* (1/taun)
    
    # Quadrature setup
    N = 64
    points, weights = roots_laguerre(N)
    
    # Shorthands
    x = points
    
    z = np.expand_dims(me/(T),-1)
    x = points + 1 #Shift integral from 0 to infinity to 1 to infinity.
    znu = np.expand_dims(me/(Tnu), -1)

    # Define both integrals, sum, and normalize
    int1 = (x*(x+q)**2 * (x**2 - 1)**(1/2))
    denom1 = ((1+np.exp(-x*z))*(1+np.exp((x+q)*znu)))
    int2 = (x*(x-q)**2 * (x**2 - 1)**(1/2))
    denom2 = ((1+np.exp(x*z))*(1+np.exp(-(x-q)*znu)))

    lpn = K*(int1/denom1+int2/denom2)
    
    # Likewise for reverse
    rint1 = (x*(x-q)**2 * (x**2 - 1)**(1/2))
    rdenom1 = ((1+np.exp(-x*z))*(1+np.exp((x-q)*znu)))
    
    rint2 = (x*(x+q)**2 * (x**2 - 1)**(1/2))
    rdenom2 =((1+np.exp(x*z))*(1+np.exp((-(x+q))*znu)))
    
    lnp = K*(rint1/rdenom1 + rint2/rdenom2)

    # Weight for GL Quadrature
    lnp = lnp*np.exp(x-1)
    lpn = lpn*np.exp(x-1)
    
    # Approximates the integral
    lnp = np.dot(lnp, weights)
    lpn = np.dot(lpn,weights)
    
    return lnp, lpn


def n_p_abundance(T, state): 

    t, Tnu, X_n, X_p = state 

    # Some constants 

    lambda_n2p = WeakRate(T, Tnu)[0]
    lambda_p2n = WeakRate(T, Tnu)[1]

    # Differential equations for the abundances of neutrons and protons

    dTnu_dT, dt_dT = Friedmann(T, [Tnu, t])

    dXn_dT = ( lambda_p2n * X_p - lambda_n2p * X_n ) * dt_dT 

    dXp_dT = ( lambda_n2p * X_n - lambda_p2n * X_p ) * dt_dT

    return [dt_dT, dTnu_dT, dXn_dT, dXp_dT]


def np_evolution(T): 

    Ti = T[0]

    # Solving for t, T and Tnu 
    FriedmannIntegration= solve_ivp(Friedmann,T[[0,-1]],[Ti,0], t_eval=T)
    T = FriedmannIntegration.t
    Tnu = FriedmannIntegration.y[0]
    t = FriedmannIntegration.y[1]

    t_as_func_of_T = interpolate.interp1d(T, t, kind='linear', fill_value='extrapolate')


    # Obtaining initial abundances of n and p
    def n_p_inital_abundance(Temp):

        T_fo = 0.9 * (v/v0)**(4/3)
        Gamma_n = 1/880 * (v/v0)**4 

        exp_factor = (Q/T_fo) + Gamma_n * t_as_func_of_T(Temp)

        X_n = 1/(1 + np.exp(exp_factor))
        X_p = 1 - X_n  

        return X_n, X_p


    Xn_initial = n_p_inital_abundance(Ti)[0]
    Xp_initial = n_p_inital_abundance(Ti)[1]

    # Obtaining the weak rates for n <-> p conversions
    with warnings.catch_warnings():
        warnings.filterwarnings('ignore', category=RuntimeWarning)
        weak_np, weak_pn = WeakRate(T, Tnu)

    # Getting the abundances of n and p as a function of T
    abundance = solve_ivp(fun= n_p_abundance, t_span= T[[0, -1]], y0= [0, Ti, Xn_initial, Xp_initial], t_eval= T, method= 'Radau')

    t = abundance.y[0]
    Tnu = abundance.y[1]
    X_n = abundance.y[2]
    X_p = abundance.y[3]

    return t, Tnu, X_n, X_p


# ===========================================================================================================

# Strong reaction rates calculations 

def StrongRates(T9, Tnu9):
    """
    Approximate the strong reaction rates using the most recent Reaclib DB polynomial approximations. 
    
    INPUT: 
    T9 - Temperature array in 10^9 Kelvins. TYPE : [1xn] or [n] ndarray or equivalent.
    
    OUTPUTS:
    Forward - Reaction rates in cubic cm per second per mole. TYPE : [11xn] ndarray
    Reverse - Reverse reaction rates in the same units. Same type. 
    """
    
    # A word of warning to those who want to code this-- Use an Einstein sum. Especially for bigger networks/stellar nucleosynthesis.
    # This representation is simply to demonstrate the network structure.

    rhob = h*(T9)**3
    
    # Shorthands
    T913 = T9**(1/3)
    T953 = T9**(5/3)

    T9 = np.asarray(T9)
    
    # All updated rate parameters from the Reaclib DB.

    def fit(a0, a1, a2, a3, a4, a5, a6):
        'This fit cuts T9 because the rates explode for large T9 in the Reaclib fit. Namely, rxn '
        T9_fit = np.clip(T9, 1e-3, 10)
        T913_fit = T9_fit**(1/3)
        T953_fit = T9_fit**(5/3)
        return np.exp(a0 + a1/T9_fit + a2/T913_fit + a3*T913_fit
                    + a4*T9_fit + a5*T953_fit + a6*np.log(T9_fit))
    
    # Forward Rates are polynomial fits
    # They are reaction cross-sections, <sigma v> * NA
    
    crosssection = np.asarray([
    
        #1. p + n --> D + γ
        fit(8.846880e+00, 0.000000e+00, 0.000000e+00, -1.020820e-02, -8.939590e-02, 6.967040e-03, 1.000000e+00) + fit(1.236870e+01, 0.000000e+00, 0.000000e+00, -2.706180e+00, 1.171800e-01, -3.127880e-03, 4.691270e-01) + fit(1.075480e+01, 0.000000e+00, 0.000000e+00, -2.304720e+00, -8.878620e-01, 1.376630e-01, 0.000000e+00),
    
        #2. D + p --> He3 + γ  
        fit(6.732230e+00, -4.379150e-04, -3.583620e+00, 2.882830e+00, -1.186750e-01, -4.208940e-16, -6.131680e-01),

        #3. D + D --> n + He3
        fit(1.908760e+01,-1.900200e-04,-4.229200e+00,1.693200e+00,-8.555290e-02,-1.357090e-25,-7.345130e-01),

        #4. D + D --> p + T
        fit(1.880520e+01,4.362090e-05,-4.322960e+00,1.915720e+00,-8.156200e-02,-3.288040e-22,-8.795180e-01),

        #5. He3 + n --> p + T
        fit(2.037870e+01,0.000000e+00,0.000000e+00,-3.327880e-01,-7.004850e-01,9.765210e-02,0.000000e+00) + fit(1.927620e+01,0.000000e+00,0.000000e+00,4.385570e-02,-2.015270e-01,1.534330e-02,1.000000e+00),

        #6. T + D --> n + He4
        fit(3.934570e+01, 0.000000e+00, -4.524400e+00, -1.640280e+01, 1.731030e+00, -1.229660e-01, 2.313040e+00) + fit(2.517940e+01, 0.000000e+00, -4.524400e+00, 3.503370e-01, 5.874700e-01, -8.849090e+00, -6.666670e-01),

        #7. He3 + D --> p + He4
        fit(2.468390e+01, 0.000000e+00, -7.182000e+00, 4.732880e-01, 1.468470e+00, -2.796030e+01, -6.666670e-01) + fit(4.129690e+01, 0.000000e+00, -7.182000e+00, -1.713490e+01, 1.369080e+00, -8.144230e-02, 3.353950e+00),

        #8. He3 + He4 --> Be7 + γ
        fit(1.560990e+01, 0.000000e+00, -1.282710e+01, -3.082250e-02, -6.546850e-01, 8.963310e-02, -6.666670e-01) + fit(1.770750e+01, 0.000000e+00, -1.282710e+01, -3.812600e+00, 9.422850e-02, -3.010180e-03, 1.333330e+00),
        
        #9. T + He4 --> Li7 + γ
        fit(1.361620e+01,0.000000e+00,-8.080500e+00,-2.175140e-01,-1.148590e-01,4.700430e-02,-6.666670e-01),
        
        #10. Be7 + n --> p + Li7
        fit(2.178990e+01,7.280980e-04,-3.025400e-01,-3.602000e-01,1.747200e-01,-2.230000e-02,-4.581000e-01),

        #11. Li7 + p --> He4 + He4
        fit(2.044380e+01,0.000000e+00,-8.472700e+00,2.979340e-01,5.823350e-02,-4.133830e-03,-6.666670e-01) + fit(2.189990e+01,-2.615270e+01,0.000000e+00,0.000000e+00,0.000000e+00,0.000000e+00,-1.500000e+00) + fit(1.195760e+01,0.000000e+00,-8.472700e+00,4.179430e-01,5.345650e+00,-4.868400e+00,-6.666670e-01) + fit(1.425380e+01,-4.478000e+00,0.000000e+00,0.000000e+00,0.000000e+00,0.000000e+00,-1.500000e+00)
        ])
    
    # Equation 40:
    ForwardRate = (crosssection)*rhob

    mass_excess = MeVtoK9(np.array([
        2.22457,5.493, 3.2689 ,4.03266,0.7638, 17.589 , 18.353, 1.5861,2.467, 1.644, 17.347 
        ]))
    
    an, ap, ad, at, a3, a4, ali7, abe7 = np.array([mn, mp, md, mt, m3, m4, mli7, mbe7])/amu

    conversion = 0.98677e10
    prefactors = np.array([

        # A = 1 for p & n, = 2 for D, = 3 for T & He3, = 4 for He4, = 7 for Be7 and Li7
        # g = 2 for n,p, T, He3, g=3 for D, g=1 for He4, g=4 for Li7 and Be7.
        # Below is (g)*(A)^3/2 * exp(-Q/T) and, in the case of photon emission, multiplied by the corrective factor in Eq. 42.

        #1. p + n --> D + γ
        conversion*((2*2)/(3) * ((an*ap)/(ad))**(3/2)* rhob**(-1) * T9**(3/2) * np.exp(-mass_excess[0]/(T9))),
        #2. D + p --> He3 + γ
        conversion*((3*2)/(2) * ((ad*ap)/(a3))**(3/2)* rhob**(-1) * T9**(3/2)* np.exp(-mass_excess[1]/(T9))),
        #3. D + D --> n + He3
        (3*3)/(2*2) * ((ad*ad)/(an*a3))**(3/2)* np.exp(-mass_excess[2]/(T9)),
        #4. D + D --> p + T
        (3*3)/(2*2) * ((ad*ad)/(ap*at))**(3/2)* np.exp(-mass_excess[3]/(T9)),
        #5. He3 + n --> p + T
        (2*2)/(2*2) * ((a3*an)/(ap*at))**(3/2)* np.exp(-mass_excess[4] /(T9)),
        #6. T + D --> n + He4
        (2*3)/(2*1) * ((at*ad)/(an*a4))**(3/2)* np.exp(-mass_excess[5]/(T9)),
        #7. He3 + D --> p + He4
        (2*3)/(2*1) * ((a3*ad)/(ap*a4))**(3/2)* np.exp(-mass_excess[6]/(T9)),
        #8. He3 + He4 --> Be7 + γ
        conversion*((2*1)/(4) * ((a3*a4)/(abe7))**(3/2)* rhob**(-1) * T9**(3/2)* np.exp(-mass_excess[7]/(T9))),
        #9. T + He4 --> Li7 + γ
        conversion*((2*1)/(4) * ((at*a4)/(ali7))**(3/2)* rhob**(-1) * T9**(3/2)* np.exp(-mass_excess[8]/(T9))),
        #10. Be7 + n --> p + Li7
        (2*4)/(2*4) * ((an*abe7)/(ap*ali7))**(3/2)* np.exp(-mass_excess[9]/(T9)),
        #11. Li7 + p --> He4 + He4 
        (4*1)/(1*1) * ((ali7*ap)/(a4*a4))**(3/2)* np.exp(-mass_excess[10]/(T9))
        ])

    # Equations 41 and 42:
    ReverseRate = prefactors*ForwardRate

    return np.asarray([ForwardRate, ReverseRate])


# FULL BBN EVOLUTION

def BBN_evolution(T):

    t, Tnu, X_n, X_p = np_evolution(T)

    T9i = MeVtoK9(T[0])
    T9 = MeVtoK9(T)
    Tnu9 = MeVtoK9(Tnu)

    ### NUCLEAR STATISTICAL EQUILIBRIUM (NSE) ###
    def NSEAbundances(T,Bind, A, gA):
        '''
        T - Temperature in MeV
        Bind - Binding energy in MeV
        A - Mass number of the atom
        gA - 
        '''
        coeff = gA * η0**(A-1) * (zeta_3**(A-1) * pow(np.pi, ((1-A)/2)) * pow(2, ((3*A-5)/2))) * A**(5/2)
        XA = coeff * (T/mn)**((3*(A-1))/2) * np.exp(Bind/T)

        return XA

    # Initial conditions for BBN code, NSE abundances of elements.

    # Out-front factor is assuming initial conditions at our starting time have Xp ~ Xn, so it is (1/2)^A where A is the mass number.

    Xn0 = X_n[0]
    Xp0 = X_p[0]

    XDNSE0 = (Xp0)**1 * (Xn0)**1 * NSEAbundances(T9i, Bd, 2, 3)
    XTNSE0 = (Xp0)**1 * (Xn0)**2 * NSEAbundances(T9i, Bt, 3, 2)
    X3NSE0 = (Xp0)**2 * (Xn0)**1 * NSEAbundances(T9i, B3, 3, 2)
    X4NSE0 = (Xp0)**2 * (Xn0)**2 * NSEAbundances(T9i, B4, 4, 1)
    XLi7NSE0 = (Xp0)**3 * (Xn0)**4 * NSEAbundances(T9i, Bli7, 7, 4)
    XBe7NSE0 = (Xp0)**4 * (Xn0)**3 * NSEAbundances(T9i, Bbe7, 7, 4)

    X0 = np.zeros(8,)
    X0[1] = Xn0
    X0[0] = Xp0
    X0[2] = XDNSE0
    X0[3] = XTNSE0
    X0[4] = X3NSE0
    X0[5] = X4NSE0
    X0[6] = XLi7NSE0
    X0[7] = XBe7NSE0


    # Obtaining the weak rates
    weak_np, weak_pn = WeakRate(T, Tnu)

    # Obtaining the strong rates 

    ForwardRate, ReverseRate = StrongRates(T9, Tnu9)


    # Defining the system of ODEs for the abundances of the elements in BBN

    interpolation = interpolate.interp1d(t, [T9, Tnu9, weak_np, weak_pn], 'cubic',fill_value='extrapolate') 


    def BBN(t,Y):
    
        Yp, Yn, YD, YT, YHe3, YHe4, YBe7, YLi7 = Y

        T9,Tnu9,np,pn = interpolation(t)

        F, R = StrongRates(T9,Tnu9)

        #1. p + n <--> D + γ

        #2. D + p <--> He3 + γ
    
        #3. D + D <--> n + He3

        #4. D + D <--> p + T

        #5. He3 + n <--> p + T

        #6. T + D <--> n + He4

        #7. He3 + D <--> p + He4

        #8. He3 + He4 <--> Be7 + γ

        #9. T + He4 <--> Li7 + γ

        #10. Be7 + n <--> p + Li7

        #11. Li7 + p <--> He4 + He4
        
        dYpF = -pn*Yp + np*Yn - F[0]*Yp*Yn - F[1]*Yp*YD + (1/2)*F[3]*YD**2 + F[4]*YHe3*Yn + F[6]*YHe3*YD + F[9]*YBe7*Yn - F[10]*YLi7*Yp
        dYnF = -np*Yn + pn*Yp - F[0]*Yp*Yn +  (1/2) * F[2]*YD**2 - F[4]*YHe3*Yn + F[5]*YT*YD - F[9]*YBe7*Yn
        dYDF = F[0]*Yp*Yn - F[1]*Yp*YD - F[2]*YD**2 - F[3]*YD**2 - F[5]*YT*YD - F[6]*YHe3*YD
        dYTF = (1/2)* F[3]*YD**2 + F[4]*YHe3*Yn - F[5]*YT*YD - F[8]*YT*YHe4
        dYHe3F = F[1]*Yp*YD +  (1/2)*F[2]*YD**2 - F[4]*YHe3*Yn - F[6]*YHe3*YD - F[7]*YHe4*YHe3
        dYHe4F = F[5]*YT*YD + F[6]*YHe3*YD - F[7]*YHe4*YHe3 - F[8]*YT*YHe4 + F[10]*YLi7*Yp
        dYBe7F = F[7]*YHe4*YHe3 - F[9]*YBe7*Yn
        dYLi7F = F[8]*YT*YHe4 + F[9]*YBe7*Yn - (1/2)*F[10]*YLi7*Yp 

        dYpR = R[0]*YD + R[1]*YHe3 - R[3]*Yp*YT - R[4]*Yp*YT - R[6]*YHe4*Yp - R[9]*YLi7*Yp + (1/2) * R[10]*YHe4**2
        dYnR = R[0]*YD - R[2]*YHe3*Yn + R[4]*Yp*YT - R[5]*YHe4*Yn + R[9]*YLi7*Yp
        dYDR = -R[0]*YD + R[1]*YHe3 + 2*R[2]*YHe3*Yn + 2*R[3]*Yp*YT + R[5]*YHe4*Yp + R[6]*YHe4*Yp
        dYTR = - R[3]*Yp*YT - R[4]*Yp*YT + R[5]*YHe4*Yp + R[8]*YLi7
        dYHe3R = -R[1]*YHe3 - R[2]*YHe3*Yn + R[4]*Yp*YT + R[6]*YHe4*Yp + R[7]*YBe7
        dYHe4R = -R[5]*YHe4*Yn - R[6]*YHe4*Yp + R[7]*YBe7 + R[8]*YLi7 -  R[10]*YHe4**2
        dYBe7R = -R[7]*YBe7 + R[9]*YLi7*Yp
        dYLi7R = -R[8]*YLi7 - R[9]*YLi7*Yp +  (1/2) * R[10]*YHe4**2 

        dYp = dYpF + dYpR
        dYn = dYnF + dYnR
        dYD = dYDF + dYDR
        dYT = dYTF+dYTR
        dYHe3 = dYHe3F + dYHe3R
        dYHe4 = dYHe4F + dYHe4R
        dYBe7 = dYBe7F + dYBe7R
        dYLi7 = dYLi7F + dYLi7R

        return dYp, dYn, dYD, dYT, dYHe3, dYHe4, dYBe7, dYLi7


    ### SOLVING THE ODE ###
    Y = solve_ivp(BBN, t[[0,-1]], X0, t_eval=t, dense_output=True, method='Radau',rtol=1e-10,atol=1e-12)
    # print(Y)

    return Y