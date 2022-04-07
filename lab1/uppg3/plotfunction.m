M = 1.05e4;
f = @(x) max(generator(x, 0)) - M;
x = 1:1:100;
plot(x, f(x))