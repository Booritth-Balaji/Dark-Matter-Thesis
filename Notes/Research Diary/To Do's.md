The plan: 

1. Recreate the forward rates just using the REACLIB database and compare it with the ones from BBN-simple:  
    [x] Figure out what the rho_b term comes from. 
        - Kawano: Let's go early universe 2 
    [ ] Use Kawano's rho_b and calculate the forward rates and then compare it with BBN-simple so that if there was a difference 
        in the rate from REACLIB and the one used in BBN-simple (from Smith-et-al) you can find out

        - The rates calculated from REACLIB

    [ ] Once that is verified, implement constants from scipy (for calculating rho_b)
        - Ideally this would not make that much of a difference. 

2. Backward Rates 
    [x] Figure out what this conversion factor from this mysterious equation 42 is and where is it coming from? 
        - Fowler et al. (1967): Thermonuclear Reaction Rates
    [ ] Check the BBN synthesis just using that. Then implement the -11.605 factor into the exponential. 


Possible reasons for difference: 

- using A instead of the actual masses for Y calculations? 





