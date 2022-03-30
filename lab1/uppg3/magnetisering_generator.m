M = 1.05e4;
f = @(x) max(generator(x, 0)) - M;
% initial guesses
x0 = 30;
x1 = 60;

theta = secantmethod(f, x0, x1, 0.0001);
disp(theta);