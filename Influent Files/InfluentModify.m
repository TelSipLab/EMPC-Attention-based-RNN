function out = InfluentModify( InfluentData, CODrat, SNHrat, Qrat)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    [m,n] = size(InfluentData);
    out = zeros(m,n);
    for j = 1:m
        for i = 1:n
            if i==3 %i>2 && i<9
                if CODrat > 1 
                    out(j,i) = InfluentData(j,i)*CODrat + 49.45;
                else
                    out(j,i) = InfluentData(j,i)*CODrat;
                end
            elseif i == 5
                out(j,i) = InfluentData(j,i)*CODrat;
            elseif i == 11
                out(j,i) = InfluentData(j,i)*SNHrat;
            elseif i == 16
                out(j,i) = InfluentData(j,i)*Qrat;
            else
                out(j,i) = InfluentData(j,i);
            end
        end
        out(j,15) = 0.75*sum(out(j,4:8));
    end
end

