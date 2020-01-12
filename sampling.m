% This program generates 500 new samples from sample2009.txt

%% Initialisation
clear();

bins=6 ;                             % Number of bins
Data0=importdata('sample2019.txt');  % Sample data
DataNew=zeros(500,1);                % Array of new samples
histogram(Data0,bins);               % Histogram of Data0
title('Data0');
ylabel('Frequency');
xlabel('Value');
%% Extract data
axisHandle0=gca;                     
histHandle0=axisHandle0.Children;
binHeight0=histHandle0.Values;       % Bin heights
binEdges0=histHandle0.BinEdges;      % Bin edges

%% Probability of being in each bin
P0=zeros(1,bins);
for i=1:bins
    P0(i)=binHeight0(i)/500;
end

%% To generate 500 samples 

% Construct the CDF
c=cumsum(P0);

for i=1:500
    
    u=rand(); % random variable 
    
    % Locate the segment u is in by finding the first index in c where u<=c
    j=find(u<=c,1,'first');
    
    % Define variables for the formula
    a=binEdges0(j);b=binEdges0(j+1);cq=c(j);
    
    if j==1
        cqq=0;
    else
        cqq=c(j-1);
    end
    
    % Compute x
    DataNew(i)=((b-a)/(cq-cqq))*(u-((b*cqq-a*cq)/(b-a)));
end

%% Kullback Leibler Divergence

% Extract data from DataNew's histogram 
histogram(DataNew,bins);
axisHandleNew=gca;                     
histHandleNew=axisHandleNew.Children;
binHeightNew=histHandleNew.Values;       % Bin heights
binEdgesNew=histHandleNew.BinEdges;      % Bin edges

PNew=zeros(1,bins);
for i=1:bins
    PNew(i)=binHeightNew(i)/500;
end

% Calculate the Kullback Leibler divergence 
output=computeKLD(P0,PNew,6)

%% Plot graphs
figure;
subplot(1,2,1);
histogram(Data0,bins);
title('Data0');
ylabel('Frequency');
xlabel('Value');
subplot(1,2,2);
histogram(DataNew,bins);
title('DataNew');
ylabel('Frequency');
xlabel('Value');