1. What does the equilibrium dashed curve in figure 2 right side even mean? 

    - It means NSE stability, essentially the initial state of the universe where the weak interaction kept p and n in equilibrium, so their ratio was determined by the Boltzmann factor. 

2. And how is there a quicker downfall of the number of neutrons there than the actual curve? (marked in red in the paper)

3. Eqn 30 is wrong, right? And in eqn 38/40/42/43/51 shouldn't it be the other way around, since the number density of i is decreasing when i + j -> k + l 

4. If we are going to be working with BBN stuff when we change the weak scale value... How are we going to calculate the cross sections for these interactions... They seem to be experimental calculations, and the cross sections would rely on the masses of the particles right?

5. Are we assuming NSE ends for all the elements involved (>= D) when the proton-neutron freeze out happens and they lose their NSE stability? 

    - Probably no, look at Kolb and Turner chapter 4 -> good resource for this time period

    - Is NSE lost as soon as T drops below the binding energy of the element?

---



1. Spin state of Li7 and Be7 in the code seems to be wrong. It should be 4 (since s = 3/2 for both) but its given 5 in the code. 

2. In the code, while calculating the reaction rates, for any temperature above 10e9 K, they cut it to be 10e9 K. For example, 11 or 100 K9 would just be 10 K9. Would this cause problems in the future for us? 

    - Their reasoning was that: "This fit cuts T9 because the rates explode for large T9 in the Reaclib fit. Namely, rxn"
        
        - It does explode after like 10 K9... either explodes up or down. 

        - So the neutrino decoupling happens at about 0.8 MeV which is about 11 K9 or 11e9 K. So we really would not need more than 11 or 12 K9 data since BBN would not have happened after that anyways. Sooo yeah. CONFIRM THIS

        - The formation of D was not favoured until about 0.07 MeV. Considering say 0.2 MeV might have been when D production might have started picking up, that comes out to be 2.32 K9... So a bound of 10 K9 shouldn't be that bad I suppose. 

        - Plotting both the rate equations side by side, the difference seems to be only about a few percentages at about 2 K9, so I guess the evolution would be okay regardless? But the difference between the two keeps increasing after about 10 K9... and at about 15 K9 the difference between the rates come out to be about 40-50% !! 

    - This may or may not also be connected to why they use Kawano's cross section calculations in the middle randomly for few reactions instead of REACLIB. 

        - NO, this isnt the reason. The reaction rates *almost* perfectly line up for upto 10 K9. But after that the REACLIB rates do indeed shoot up/down extremely rapidly. 

3. HIS CODE IS WRONG. Albeit I dont think it would change much, but he was using T9i instead of Ti while calculating NSE. 
    