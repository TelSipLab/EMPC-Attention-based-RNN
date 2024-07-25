function flow_out = combiner_model(flow_1,flow_2)

    flow_total = flow_1(8) + flow_2(8);
    flow_out = [];

    if (flow_1(end) > 0) || (flow_2(end) > 0)
        for i = 1:7
            tmp = ((flow_1(i)*flow_1(8)) + (flow_2(i)*flow_2(8))) / flow_total;
            flow_out = [flow_out ; tmp];
        end
        flow_out = [flow_out ; flow_total];
    else
        flow_out = zeros(8,1);
    end

end