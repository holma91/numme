function x = secantmethod(f,x0,x1,n)
    % f -- the function
    % x0, x1 -- starting guesses
    % n -- number of steps to do
    % returns x -- the approximate solution

    y0 = f(x0);
    y1 = f(x1);
    for i = 1:n
        x = x1 - y1*(x1 - x0)/(y1 - y0); % secant formula
        y = f(x);
        disp("i = " + i + ", y = " + y);
        disp("i = " + i + ", x = " + x);
        % move numbers for the next iteration
        x0 = x1;
        y0 = y1;
        x1 = x;
        y1 = y;
    end
end



