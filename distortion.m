function y = distortion(x, gain, mix)
    N=length(x);
    %preallocate y and d
    y = zeros(1,N);
    d = zeros(1,N);
    for n=1:N
        a = -gain * abs(x(n)); %exponent for distortion equation
        d(n) = sign(x(n)) * (1 - exp(a)); %compute distortion term
        y(n) = x(n)*(1-mix) + mix*d(n); %mix the signals
    end
end