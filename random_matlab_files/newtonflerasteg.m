function [x, y] = newtonflerasteg()
% Anonyma funktioner f ̈or F och J
    F = @(x,y)[(x-2)^2+y^2-9; x^2/4+y^2/16-1];
    J = @(x,y)[2*(x-2) 2*y;x/2 y/8]; % Jakobian
    x = 2; y = 2; % Startgissning
    tol = 1e-5; hnorm = 1; iter = 0;
    while hnorm > tol && iter < 20
        iter = iter + 1;
        h = -J(x,y)\F(x,y);
        x = x + h(1); y = y + h(2);
        hnorm = norm(h);
        disp([iter x y hnorm])
    end