function y = fircomb(x, ms, g, Fs)
    M = round(ms*Fs/1000);
    z = tf('z', 0.1);
    H = 1+g*z^-M;

    [y,~]=lsim(H,x);
end


