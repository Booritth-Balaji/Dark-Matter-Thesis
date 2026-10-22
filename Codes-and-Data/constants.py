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
Q = 939.5654133 - 938.2720813 # Proton-Neutron Mass Difference in [MeV/c^2]
amu = 931.494003 # AMU in MeV
q = Q/me # Exponential NSE Mass ratio [unitless]

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
taun = 880 * (v/v0)**4 # Average lifetime of a neutron before decay [s]
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


# def n_p_inital_abundance(T, mn_minus_mp = Q):

#     T_fo = 0.9 * (v/v0)**(4/3)
#     Gamma_n = 1/880 * (v/v0)**4 * (Q/mn_minus_mp)**5

#     exp_factor = (mn_minus_mp/T_fo) + Gamma_n * t_as_func_of_T(T)

#     X_n = 1/(1 + np.exp(exp_factor))
#     X_p = 1 - X_n  

#     return X_n, X_p



def n_p_abundance(T, state): 

    t, Tnu, X_n, X_p = state 

    # Some constants 

    lambda_n2p = WeakRate(T, Tnu)[0]
    lambda_p2n = WeakRate(T, Tnu)[1]

    # Differential equations for the abundances of neutrons and protons

    Tnu = state[1]
    rhog, Pg = Photon(T)
    rhonu,Pnu = Neutrino(Tnu)
    rhoe, Pe,cve = ElectronPositron(T)
    drhodT = (cve+4*rhog)/T
    H = np.sqrt(rhoe + rhonu + rhog) * np.sqrt(8*pi*G/3)
    drhodt = -3*H*(rhoe +rhog + Pe + Pg) # Continuity equation: drho_total/dt

    dt_dT = drhodT/drhodt
    dTnu_dT = -H*Tnu*dt_dT


    dXn_dT = ( lambda_p2n * X_p - lambda_n2p * X_n ) * dt_dT 

    dXp_dT = ( lambda_n2p * X_n - lambda_p2n * X_p ) * dt_dT

    return [dt_dT, dTnu_dT, dXn_dT, dXp_dT]



# Xn_initial = n_p_inital_abundance(Ti)[0]
# Xp_initial = n_p_inital_abundance(Ti)[1]

# abundance = solve_ivp(fun= n_p_abundance, t_span= T[[0, -1]], y0= [0, Ti, Xn_initial, Xp_initial], t_eval= T, method= 'Radau')

# # t = abundance.y[0]
# Tnu = abundance.y[1]
# X_n = abundance.y[2]
# X_p = abundance.y[3]
