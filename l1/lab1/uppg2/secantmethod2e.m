
function [x, itercount] = secantmethod2e()
x0 = 0.8;
x1 = 1;
f = @(x) x.^2 - 2*sin(3*x + 1) - 2;
y0 = f(x0);
y1 = f(x1);
itercount = 0;
tol = 1e-8;

while abs(x0 - x1) > tol
        x = x1 - y1*(x1 - x0)/(y1 - y0); % secant formula
        y = f(x);
        x0 = x1;
        y0 = y1;
        x1 = x;
        y1 = y;
        itercount = itercount + 1;
end
disp(itercount)
disp(x)

end

% Det beror på, eftersom man kan välja en godtycklig startpunkt
% med newtons metod som ger färre iterationer, samtidigt som man
% också kan välja en som kräver fler iterationer.