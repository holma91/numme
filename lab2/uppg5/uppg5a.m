function P = uppg5a(Xstart)
    F = @(x) [1*cos(x(1)) + 1*cos(x(2)) - 1.3; 1*sin(x(1)) + 1*sin(x(2)) - 1.3];
    J = @(x) [-sin(x(1)), -sin(x(2)); cos(x(1)), cos(x(2))];
    
    P = Xstart;
    
    tol = 1e-10; hnorm = 1; iter = 0; 
    % newtons metod för flera variabler
    while hnorm > tol
        iter = iter + 1;
        h = -J(P)\F(P);
        P = P + h;
        hnorm = norm(h);
    end

    plot_robotarm(P);