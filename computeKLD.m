% This function calculates the Kullback-Leibler measure between two sets of
% data. 

%% Kullback Leibler Divergence

function[output]=computeKLD(data1,data2,N)

output=0;
for i=1:N
    output=output+data1(i)*log(data1(i)/data2(i));
end

end