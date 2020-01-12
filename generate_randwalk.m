% This function simulates the biased random walk, outputting an array of
% the frequency of each final x-position

function[output]= generate_randwalk(N,P,s,w,e)

markers = zeros(100,100);   % Array of x and y coordinates
x_pos=1; y_pos=1;           % Each particle's current location
stop=0;                     % Flag to act as a boolean variable
output = zeros(1,120);      % The final positions of each particle

for i=1:N
    
    % Set initial position of the particles
    y_pos=1;
    if P==1                 % Position 1
        x_pos=50;
    elseif P==2             % Position 2
        if i<=60
            x_pos=25;
        else
            x_pos=75;
        end
    elseif P==3             % Position 3
        if i<=40
            x_pos=25;
        elseif i>40 && i<=80
            x_pos=50;
        else
            x_pos=75;
        end
    elseif P==4             % Position 4
        if i<=30
            x_pos=20;
        elseif i>30 && i<=60
            x_pos=40;
        elseif i>60 && i<=90
            x_pos=60;
        else
            x_pos=80;
        end
    end
    
    stop=0; % reset stop flag
    
    % each step of the particle's walk
    while y_pos < 99 && stop~=1
        
        r=rand(); % generate a random sample

        % WEST is chosen
        if r < w
            % generate a new sample if the location is occupied
            if x_pos<=1 || markers(y_pos,x_pos-1)==1
                continue
            else
                x_pos = x_pos-1; % move west
            end
        end
        
        % EAST is chosen
        if r >= w && r < 1-s
            % generate a new sample if the location is occupied
            if x_pos>=99 || markers(y_pos,x_pos+1)==1 
                continue
            else
                x_pos = x_pos+1; % move east
            end
        end
        
        % SOUTH is chosen
        if r >= 1-s
            if markers(y_pos+1,x_pos)==1
                stop=1;
            else
                y_pos = y_pos+1; % move south
            end
        end
        
        % If the particle hits the side boundary, it moves back in the
        % direction it came from
        if x_pos>99
            x_pos=99;
        end
        if x_pos<1
            x_pos=1;
        end
        
        %markers(y_pos,x_pos)=2;   % debug marker to show path of walk
    end
    
    % mark the final position of the particle
    markers(y_pos,x_pos)=1;
    
    % add the final position of the particle into the sample array
    output(i)=x_pos;
end
end