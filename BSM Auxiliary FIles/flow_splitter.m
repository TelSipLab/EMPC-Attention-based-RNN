function [flow_out_1,flow_out_2] = flow_splitter(flow,qa)


    % flow_out_1 = [flow(1) flow(2) flow(3) flow(4) flow(5) flow(6) flow(7) 3*18446*qa];
    % flow_out_2 = [flow(1) flow(2) flow(3) flow(4) flow(5) flow(6) flow(7) flow(8)-(3*18446*qa)];

    flow_out_1 = [flow(1) flow(2) flow(3) flow(4) flow(5) flow(6) flow(7) qa];
    flow_out_2 = [flow(1) flow(2) flow(3) flow(4) flow(5) flow(6) flow(7) flow(8)-(qa)];

end