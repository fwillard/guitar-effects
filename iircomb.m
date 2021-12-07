function y = iirdelay(x, ms, g, Fs)
    M = round(ms*Fs/1000);
    z = tf('z', 0.1);
    H = 1/(1-g*z^-M); % the transfer function

    [y,~]=lsim(H,x); %apply the transfer function to the signal
end