function [c,ceq] = nonlinear_constraints(DV,x,u_prev,Ts,ctrl_hor,pred_hor, ...
    k,INFLUENT_REDUCED,dry_flow_predictions)

    u = zeros(pred_hor,4);

    % --- Generate Optimal Controls Trajectories --- %
    for nc = 1:ctrl_hor
        u(nc,1) = u_prev(1) + DV(nc,1);
        u(nc,2) = u_prev(2) + DV(nc,2);
        u(nc,3) = u_prev(3) + DV(nc,3);
        u(nc,4) = u_prev(4) + DV(nc,4);
        
        u_prev(1) = u(nc,1);
        u_prev(2) = u(nc,2);
        u_prev(3) = u(nc,3);
        u_prev(4) = u(nc,4);
    end
    u(ctrl_hor+1:pred_hor,1) = u(ctrl_hor,1);
    u(ctrl_hor+1:pred_hor,2) = u(ctrl_hor,2);
    u(ctrl_hor+1:pred_hor,3) = u(ctrl_hor,3);
    u(ctrl_hor+1:pred_hor,4) = u(ctrl_hor,4);
    % ---------------------------------------------- %

    % --- Generate Model Predictions --- %
    bsm_reduced_pred = generate_model_predictions_numerically(x,Ts,pred_hor,u,k, ...
        INFLUENT_REDUCED,dry_flow_predictions);
    
    reac1_sno_pred = bsm_reduced_pred(:,6);
    % reac4_so_pred  = bsm_reduced_pred(:,26);
    reac4_sno_pred = bsm_reduced_pred(:,27);
    reac4_snh_pred = bsm_reduced_pred(:,28);
    
    reac5_sno_pred = bsm_reduced_pred(:,34);
    % reac8_so_pred  = bsm_reduced_pred(:,54);
    reac8_sno_pred = bsm_reduced_pred(:,55);
    reac8_snh_pred = bsm_reduced_pred(:,56);
    % ---------------------------------- %

    % ---------------------------------- %
    emin_Sno1 = DV(:,5);
    emax_Sno1 = DV(:,6);
    emax_Snh4 = DV(:,7);
    emax_Sno4 = DV(:,8);

    emin_Sno5 = DV(:,9);
    emax_Sno5 = DV(:,10);
    emax_Snh8 = DV(:,11);
    emax_Sno8 = DV(:,12);
    % ---------------------------------- %

    % --- Define Constraints --- %
    % ceq = [];
    ceq = [ DV(ctrl_hor+1:end,1:4) ];

    c = [ (1 - emin_Sno1) - reac1_sno_pred  ;
          reac1_sno_pred - (7 + emax_Sno1)  ;
          reac4_snh_pred - (2 + emax_Snh4)  ;
          reac4_sno_pred - (17 + emax_Sno4) ;
          
          (1 - emin_Sno5) - reac5_sno_pred ;
          reac5_sno_pred - (7 + emax_Sno5) ;
          reac8_snh_pred - (2 + emax_Snh8) ;
          reac8_sno_pred - (17 + emax_Sno8)]; % State Inequality Constraints
    % -------------------------- %

end