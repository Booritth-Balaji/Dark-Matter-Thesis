The plan: 

To find the Y4 with varying v, we need a bunch of things first. 

1. Need to find the variation of number density of neutrons and protons as a function of time/temperature. To do that we need a bunch of other things first: 

    1.1. Differential equations of t, Tnu, Xn, Xp as a function of T. Few questions here

        1.1.1. Do the reaction rates (lambdas) depend on v by any chance? 
               
            - The normalizing factor K depends on the neutron decay lifetime, tau, which in turn could possible be related to eqn 10 in the paper

            - It also is a function of T and Tnu, so if the evolution of those guys depend on v, then need to account for that also first. 


        1.1.2. We need the evolution of t, Tnu as a function of T and figure out if any of this depends on v

            - Both of these depend on rho_gamma, rho_e, P_gamma, P_e, rho_nu, P_nu

                - rho_g and P_g do not depend on v 
                - rho_nu and P_nu also do not depend on v (assuming N_eff is independent)
                - rho_e and P_e also seem to mainly depend on m_e. If that is not varying then they also seem to be inependent. 

            - That means the time evolutions of t and Tnu are independent of T? That means the neutrino decoupling temperature is independent of v. But this does not mean that the freeze-out temperature is also independent, that is very much dependent on v. 

            That means we can confidently find the evolution of t and Tnu as a function of T, to be the same thing as it was before v was varied. So we can then worry about the next step. 


    Eqn 8 is only valid for the starting point values of number densities of n and p. The rest of the evolution is determined solely by the reaction rate, whose evolution we have confirmed to be dependent on the free neutron lifetime, which cal be calculated based on equation 10. 




Go through the code files uploaded in teams, there g* relation is there, use that to find the densities evolution and use that to find the temperature evolution of gamma and neutrinos. 