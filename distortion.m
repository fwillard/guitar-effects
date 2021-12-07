function y = distortion(x, gain, mix)
    N=length(x);
    y = zeros(1,N);
    d = zeros(1,N);
    for n=1:N
        a = -gain * abs(x(n));
        d(n) = sign(x(n)) * (1 - exp(a));
        y(n) = x(n)*(1-mix) + mix*d(n);
    end
end