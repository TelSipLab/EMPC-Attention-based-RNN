function state_plots(time,out_real,out_est,x_lim)

    
    create_plots(time,out_real.reac1,out_est.reac1,1,x_lim)
    create_plots(time,out_real.reac2,out_est.reac2,2,x_lim) 
    create_plots(time,out_real.reac3,out_est.reac3,3,x_lim)
    create_plots(time,out_real.reac4,out_est.reac4,4,x_lim)
    create_plots(time,out_real.reac5,out_est.reac5,5,x_lim)

end