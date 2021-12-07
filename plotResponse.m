clear all
figure
hold on

title('Clipping Functions')
xlabel('x')
ylabel('y')

xlim([-1.2,1.2]);
ylim([-1,1]);
syms x

y = piecewise(abs(x) < 1/3, 2*x ,(1/3 <= abs(x)) & (abs(x) < 2/3),sign(x)*(3-(2-abs(x)*3)^2)/3,sign(x))

fplot(y)

a = -3 * abs(x);
y = sign(x) * (1 - exp(a));

fplot(y)

legend('Overdrive', 'Distortion');