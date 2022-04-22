% vi anvander gauss-newton darfor att vi har fler ekvationer an okanda
% 3 ekvationer, 2 okanda

function [P, iter] = uppg4(Xa, Xb, Xc, Xstart, La, Lb, Lc)
    
    % hur hittar man F i gauss-newtons metod?
    F = @(x) [(Xa(1)-x(1)).^2+(Xa(2)-x(2)).^2 - La.^2;
        (Xb(1)-x(1)).^2+(Xb(2)-x(2)).^2 - Lb.^2;
        (Xc(1)-x(1)).^2+(Xc(2)-x(2)).^2 - Lc.^2];

    % FF = @(c) (c(1) - x(1)).^2 + (c(2) - x(2)).^2 - (c(3)).^2;

    % denna jakobian ar framtagen med newtons metod
    % hur hittar man jakobianen i gauss-newtons metod???
    J = @(x) [-2*(Xa(1)-x(1)), -2*(Xa(2)-x(2)); 
        -2*(Xb(1)-x(1)), -2*(Xb(2)-x(2));
        -2*(Xc(1)-x(1)), -2*(Xc(2)-x(2))];

    P = Xstart;

    %% Gauss-Newton

    g = @(c) c(1) + c(2)*sin(c(4)*t) + c(3)*cos(c(5)*t);
    % ?
    F = @(c) [g(c) - h];
    % bestam jakobianen
    J = @(c) [ones(size(t)), sin(t*c(4)), cos(t*c(5)), c(2)*t.*cos(t*c(4)), -c(3)*t.*sin(t*c(5))];
    
    J
    % startgissning -> baserad på MKM lösning
    c = [c; 0.5; 0.5]
    
    diff = t;
    
    while norm(diff) > 1e-6
       
        diff = J(c)\F(c);  % minsta-kvadratmetod
        c = c - diff;
        
    end

