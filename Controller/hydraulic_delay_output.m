function [output,state] = hydraulic_delay_output(current_state,combiner_flow,timeconst,dt)

    % --- Hydraulic Delay Ordinary Differential Equations --- %
    state(1) = current_state(1) + dt*(((combiner_flow(1)*combiner_flow(8)) - current_state(1)) / timeconst);
    state(2) = current_state(2) + dt*(((combiner_flow(2)*combiner_flow(8)) - current_state(2)) / timeconst);
    state(3) = current_state(3) + dt*(((combiner_flow(3)*combiner_flow(8)) - current_state(3)) / timeconst);
    state(4) = current_state(4) + dt*(((combiner_flow(4)*combiner_flow(8)) - current_state(4)) / timeconst);
    state(5) = current_state(5) + dt*(((combiner_flow(5)*combiner_flow(8)) - current_state(5)) / timeconst);
    state(6) = current_state(6) + dt*(((combiner_flow(6)*combiner_flow(8)) - current_state(6)) / timeconst);
    state(7) = current_state(7) + dt*(((combiner_flow(7)*combiner_flow(8)) - current_state(7)) / timeconst);
    state(8) = current_state(8) + dt*((combiner_flow(8) - current_state(8)) / timeconst);

    % --- Compute Hydraulic Delay Outputs --- %  
    output(1) = state(1) / state(8);
    output(2) = state(2) / state(8);
    output(3) = state(3) / state(8);
    output(4) = state(4) / state(8);
    output(5) = state(5) / state(8);
    output(6) = state(6) / state(8);
    output(7) = state(7) / state(8);
    output(8) = state(8);

end