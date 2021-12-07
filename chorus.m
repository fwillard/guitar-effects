function y = chorus(x, rate, depth, Fs)
    MAX_DELAY = 0.003; %max delay in seconds
    
    %convert max delay time to samples
    MAX_DELAY = round(MAX_DELAY * Fs); 
    
    %sample period
    T = 1/Fs;
    
    % create empty out vector
    y = zeros(length(x),1);
    
    %set first max delay samples to same as input
    %this prevents refrencing of negative samples
    y(1:MAX_DELAY)=x(1:MAX_DELAY);
    
    for n = MAX_DELAY + 1:length(x)
        %compute delays
        M1 = round((MAX_DELAY/2)*(1 + sin(2*pi*rate*n*T)));
        M2 = round((MAX_DELAY/2)*(1 + cos(2*pi*rate*n*T)));
        M3 = round((MAX_DELAY/2)*(1 + sin(2*pi*rate*n*T + pi/4)));
        %compute output signal
        y(n) = x(n) + depth * x(n-M1) + depth * x(n-M2) + depth * x(n-M3);
    end