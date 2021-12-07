function y = flanger(x, rate, depth, Fs)
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
    
    for n = MAX_DELAY:length(x)
        M = round((MAX_DELAY/2)*(1 + sin(2*pi*rate*n*T)));
        y(n) = x(n) + depth * x(n-M);
    end