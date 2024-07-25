function flow = settler(q_input, flow_in)

    gamma = (q_input + 18446 - (6000/9)) / 18446;
    
    flow = [flow_in(1) gamma*flow_in(2) gamma*flow_in(3) gamma*flow_in(4) ...
            flow_in(5) flow_in(6) flow_in(7) 18446];

end