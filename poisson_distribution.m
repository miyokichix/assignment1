% This program samples 5000 numbers from the Poisson distribution,
% normalises them and computes the KL measure between the Poisson(n) 
% samples and its limiting distribution

%% Poisson Distribution
clear();

n=[10,20,50,100,200,400];
N=5000; % number of samples

n10=poisson(10,N);
n20=poisson(20,N);
n50=poisson(50,N);
n100=poisson(100,N);
n200=poisson(200,N)
n400=poisson(400,N);

%% Normalise samples
z_n10=normalise_poisson(n10,10,N);
z_n20=normalise_poisson(n20,20,N);
z_n50=normalise_poisson(n50,50,N);
z_n100=normalise_poisson(n100,100,N);
z_n200=normalise_poisson(n200,200,N);
z_n400=normalise_poisson(n400,400,N);

%% Plot a histogram for every n
bins=30;
axis_height=700;

subplot(2,3,1);
histogram(z_n10,bins);
title('n=10');
xlabel('Value');
ylabel('Frequency');
axis([-4,4,0,axis_height]);
subplot(2,3,2);
histogram(z_n20,bins);
title('n=20');
xlabel('Value');
ylabel('Frequency');
axis([-4,4,0,axis_height]);
subplot(2,3,3);
histogram(z_n50,bins);
title('n=50');
xlabel('Value');
ylabel('Frequency');
axis([-4,4,0,axis_height]);
subplot(2,3,4);
histogram(z_n100,bins);
title('n=100');
xlabel('Value');
ylabel('Frequency');
axis([-4,4,0,axis_height]);
subplot(2,3,5);
histogram(z_n200,bins);
title('n=200');
xlabel('Value');
ylabel('Frequency');
axis([-4,4,0,axis_height]);
subplot(2,3,6);
histogram(z_n400,bins);
title('n=400');
xlabel('Value');
ylabel('Frequency');
axis([-4,4,0,axis_height]);
sgtitle('Probability distribution of Z(i,n)');

%% The standard normal distribution 
normal_dist=[0.001,0.005,0.017,0.044,0.092,0.15,0.191,0.191,0.15,0.092,0.044,0.017,0.005,0.001];

%% The probability distribution of the sample arrays

pdf_n10=get_pd(z_n10,bins);
pdf_n20=get_pd(z_n20,bins);
pdf_n50=get_pd(z_n50,bins);
pdf_n100=get_pd(z_n100,bins);
pdf_n200=get_pd(z_n200,bins);
pdf_n400=get_pd(z_n400,bins);

%% KL measures between Poisson(n) samples and the normal distribution
KLD_n10=computeKLD(pdf_n10,normal_dist,14);
KLD_n20=computeKLD(pdf_n20,normal_dist,14);
KLD_n50=computeKLD(pdf_n50,normal_dist,14);
KLD_n100=computeKLD(pdf_n100,normal_dist,14);
KLD_n200=computeKLD(pdf_n200,normal_dist,14);
KLD_n400=computeKLD(pdf_n400,normal_dist,14);

%% Create probability distribution arrays of normalised samples 
function[output]=get_pd(pdf,bins)
figure;
histogram(pdf,bins);
axisHandle0=gca;                     
histHandle0=axisHandle0.Children;
binHeight0=histHandle0.Values;       % Bin heights

output=zeros(1,5000);

% calculate probability of being in each bin
for i=1:bins
    output(i)=binHeight0(i)/5000;
end
end

%% Normalise Function
function[output]=normalise_poisson(sample,n,N)
output=zeros(1,N);
for i=1:N
    output(i)=((sample(i)-n))/(sqrt(n));
end
end

%% Poisson Function
% Generate a random variable from the Poisson distribution N times,
% then save that variable to the output array

function[output]=poisson(n,N)
output=zeros(1,N);
for i=1:N
    output(i)=poissrnd(n);
end
end