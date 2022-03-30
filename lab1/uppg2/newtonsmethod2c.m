
% Valid x0 guesses based on the graph from 2a): 1.2 and -2.5 for the largest and smallest zero value
function [] = newtonsmethod2c(f, fd, x0)
tol = 1e-8;
itercount = 0;
    % newton method with a tolerance check
    x = x0;
    y = f(x);
    while abs(y) > tol
        x = x - y/fd(x);
        y = f(x);
        itercount = itercount + 1;
    end
    disp(itercount);
    disp(x);

end