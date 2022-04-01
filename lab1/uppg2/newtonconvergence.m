function [] = newtonconvergence(f, fd, x0, xs)

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
        xx = x - xs;
        disp(xx)
        
        
    end

end