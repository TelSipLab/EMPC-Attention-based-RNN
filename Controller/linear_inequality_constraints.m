function [A,b] = linear_inequality_constraints(ctrl_hor,u_max,u_min,u_prev,num_of_controls)

    A = zeros(ctrl_hor*num_of_controls*2,ctrl_hor*(num_of_controls+8));
    b = zeros(ctrl_hor*num_of_controls*2,1);

    for i = 1:num_of_controls
    
        A_tmp = ones(ctrl_hor,ctrl_hor);
        for j = 1:size(A_tmp,1)
            A_tmp(j,j+1:end) = 0;
        end
        A_tmp = [A_tmp ; -A_tmp];
    
        A(((i-1)*ctrl_hor*2)+1:i*ctrl_hor*2,((i-1)*ctrl_hor)+1:i*ctrl_hor) = A_tmp;

        b_tmp = ones(2*(ctrl_hor),1);
        
        b_tmp(1:ctrl_hor,1) = u_max(i)-u_prev(i);
        b_tmp(ctrl_hor+1:end,1) = u_prev(i)-u_min(i);

        b(((i-1)*ctrl_hor*2)+1:i*ctrl_hor*2,1) = b_tmp;

    end
end