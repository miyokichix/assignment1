% This function generates graphs of biased random walks.

function[]=generate_graphs(s,w,e,axis_height, bins)

pos1=generate_randwalk(120,1,s,w,e);
pos2=generate_randwalk(120,2,s,w,e);
pos3=generate_randwalk(120,3,s,w,e);
pos4=generate_randwalk(120,4,s,w,e);

%% Plot graphs
set(figure, 'Visible', 'on')
subplot(2,2,1)
histogram(pos1,bins);
axis square;
axis([0,99,0,axis_height]);
title('P=1');
xlabel('Final x-position');
ylabel('Frequency');
subplot(2,2,2)
histogram(pos2,bins);
axis square;
axis([0,99,0,axis_height]);
title('P=2');
xlabel('Final x-position');
ylabel('Frequency');
subplot(2,2,3)
histogram(pos3,bins);
axis square;
axis([0,99,0,axis_height]);
title('P=3');
xlabel('Final x-position');
ylabel('Frequency');
subplot(2,2,4)
histogram(pos4,bins);
axis square;
axis([0,99,0,axis_height]);
title('P=4');
xlabel('Final x-position');
ylabel('Frequency');

end