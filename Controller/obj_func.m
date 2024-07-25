function J = obj_func(u_prev,x,DV,pred_hor,ctrl_hor,R,Ts,k,slack_weight)

    u = zeros(pred_hor,4);

    % --- Cost Penalty Matrices --- %
    R_Qa_new = R(1)*eye(ctrl_hor);
    R_KLa4   = R(2)*eye(ctrl_hor);
    R_Qa_old = R(3)*eye(ctrl_hor);
    R_KLa8   = R(4)*eye(ctrl_hor);
   
    for nc = 2:ctrl_hor
        R_Qa_new(nc,nc) = R_Qa_new(nc-1,nc-1)+10;
        R_Qa_old(nc,nc) = R_Qa_old(nc-1,nc-1)+10;
    end
    % ----------------------------- %

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

    % ---------------------------------- %
        emin_Sno1 = sum(DV(:,5));
        emax_Sno1 = sum(DV(:,6));
        emax_Snh4 = sum(DV(:,7));
        emax_Sno4 = sum(DV(:,8));
    
        emin_Sno5 = sum(DV(:,9));
        emax_Sno5 = sum(DV(:,10));
        emax_Snh8 = sum(DV(:,11));
        emax_Sno8 = sum(DV(:,12));
    % ---------------------------------- %

    % --- Compute Cost Function --- %
    J = ((8*550/(1800))*u(:,2)')*R_KLa4*((8*550/(1800))*u(:,2)) + ...
        ((0.004)*u(:,1)')*R_Qa_new*((0.004)*u(:,1)) + ...
        ((8*1067/(1800))*u(:,4)')*R_KLa8*((8*1067/(1800))*u(:,4)) + ...
        ((0.004)*u(:,3)')*R_Qa_old*((0.004)*u(:,3)) + ...
        slack_weight*(emin_Sno1 + emax_Sno1 + emax_Snh4 + emax_Sno4 + ...
                      emin_Sno5 + emax_Sno5 + emax_Snh8 + emax_Sno8);
    % ----------------------------- %

end