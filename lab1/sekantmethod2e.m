function [x, itercount] = sekantmethod2e(f, x0, x1)

y0 = f(x0);
y1 = f(x1);
itercount = 0;
tol = 1e-8;

while abs(x0 - x1) > tol
        x = x1 - y1*(x1 - x0)/(y1 - y0); % secant formula
        y = f(x);
        % disp("i = " + i + ", y = " + y);
        % disp("i = " + i + ", x = " + x);
        % move numbers for the next iteration
        x0 = x1;
        y0 = y1;
        x1 = x;
        y1 = y;
        itercount = itercount + 1;
end
disp(itercount)
disp(x)

end