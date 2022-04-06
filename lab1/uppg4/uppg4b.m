function [P, iter] = uppg4b(Xa, Xb, Xstart, La, Lb)
    F = @(x) [(Xa(1)-x(1)).^2+(Xa(2)-x(2)).^2 - La.^2;(Xb(1)-x(1)).^2+(Xb(2)-x(2)).^2 - Lb.^2;];
    J = @(x) [-2*(Xa(1)-x(1)), -2*(Xa(2)-x(2)); -2*(Xb(1)-x(1)), -2*(Xb(2)-x(2))];
    P = Xstart; % Startgissning
    
    
    tol = 1e-5; hnorm = 1; iter = 1;
    while hnorm > tol
        iter = iter + 1;
        h = -J(P)\F(P);
        P = P + h;
        hnorm = norm(h);
        disp([iter P(1) P(2) hnorm])
    end

