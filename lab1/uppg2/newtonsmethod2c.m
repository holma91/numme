
% Valid x0 guesses based on the graph from 2a): 1.2 and -2.5 for the largest and smallest zero value
% f = @(x) x.^2 - 2*sin(3*x + 1) - 2;
% df = @(x) 2*x - 6*cos(3*x + 1);
function [] = newtonsmethod2c(f, fd, x0)
tol = 1e-8;
itercount = 0;
    % newton method with a tolerance check
    x = x0;
    y = f(x);
    while abs(y) > tol
        h = - y/fd(x);
        x = x + h ;
        y = f(x);
        itercount = itercount + 1;
        disp([x h])
        
        
    end
    fprintf("\n" + "Iteration count: " + itercount);
    fprintf("\n" + "Zero point: " + x);

end