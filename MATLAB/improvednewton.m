function x = improvednewton(f, fd, x0, tol)
    % newton method with a tolerance check
    x = x0;
    y = f(x);
    while abs(y) > tol
        x = x - y/fd(x);
        disp(x);
        y = f(x);
    end
end
