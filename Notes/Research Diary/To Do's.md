The plan: 

1. Recreate the forward rates just using the REACLIB database and compare it with the ones from BBN-simple:  
    [x] Figure out what the rho_b term comes from. 
        - Kawano: Let's go early universe 2 
    [ ] Use Kawano's rho_b and calculate the forward rates and then compare it with BBN-simple so that if there was a difference 
        in the rate from REACLIB and the one used in BBN-simple (from Smith-et-al) you can find out

        - The rates calculated from REACLIB

    [ ] Once that is verified, implement constants from scipy (for calculating rho_b)
        - Ideally this would not make that much of a difference. 

2. Start worrying about backward rates 
    [ ] Figure out what this conversion factor from this mysterious equation 42 is and where is it coming from? 
    [ ] Just use the reverse reaction rates from REACLIB itself? 
        [ ] Check what is that correction thing that they were talking about in that though. 




