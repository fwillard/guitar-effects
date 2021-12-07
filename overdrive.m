function y = overdrive(x)
    N=length(x);
    %preallocate y
    y = zeros(1,N);
    for n=1:N
        if abs(x(n))< 1/3 %check if in lower 1/3
            y(n) = 2*x(n);
        elseif abs(x(n)) < 2/3 %check 1/3 to 2/3
            y(n) = sign(x(n))*(3-(2-abs(x(n))*3)^2)/3; 
        else
            y(n) = sign(x(n));
        end
    end
end