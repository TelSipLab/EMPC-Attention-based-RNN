function Fr = FreeResponse(step, step_horizon, prediction_horizon, control_horizon)

    x=step(1:step_horizon-1);
    A=hankel(step(2:step_horizon),step(2:step_horizon));
    for i=1:step_horizon-1
        for j=1:step_horizon-1
            if i+j>step_horizon
                A(i,j) = step(step_horizon);
            end
        end
    end
    B = A-repmat(x(:)',step_horizon-1,1);
    if prediction_horizon > step_horizon
        Fr = [B; zeros(control_horizon+1,step_horizon-1)];
        for i=step_horizon:prediction_horizon
            for j=1:step_horizon-1
                Fr(i,j) = Fr(i-1,j);
            end
        end
    else
        Fr = [B;B(end,:)]; %It is wrong but do not produce wrong results,
%         as the extra rows are not being used
%         Fr = B ;%B(1:prediction_horizon,:); %This is the right formulation
    end   
end