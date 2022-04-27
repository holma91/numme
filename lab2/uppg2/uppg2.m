% vi anvander gauss-newton darfor att vi har fler ekvationer an okanda
% 3 ekvationer, 2 okanda

Xa = [93; 63];
Xb = [6; 16];
Xc = [20, 83];
Xstart = [100; 20]; % startgissning
La = 55.1;
Lb = 46.2;
Lc = 46.2;

find_coordinates(Xa, Xb, Xc, Xstart, La, Lb, Lc);

%b)

%kod

function [P, iter] = find_coordinates(Xa, Xb, Xc, Xstart, La, Lb, Lc)
    % plot the circles
    circle(Xa(1), Xa(2), La);
    circle(Xb(1), Xb(2), Lb);
    circle(Xc(1), Xc(2), Lc);
    
    f = @(x,y) [La.^2 - (x-Xa(1)).^2 - (y - Xa(2)).^2;Lb.^2 - (x-Xb(1)).^2 - (y - Xb(2)).^2; Lc.^2 - (x-Xc(1)).^2 - (y - Xc(2)).^2];
    % varfor deriverar man?
    % JAKOBIANEN!
    fp = @(x,y) [-2*(x-Xa(1)) -2*(y-Xa(2)); -2*(x - Xb(1)) -2*(y - Xb(2)); -2*(x-Xc(1)) -2*(y-Xc(2))]; %derivata
    

    x = Xstart(1);
    y = Xstart(2);
    
    tol = 1e-8; hnorm = 1; iterationer = 0;
    % gauss-newton
    while hnorm > tol
       
        h = -fp(x,y)\f(x,y);
        x = x + h(1); 
        y = y + h(2);
        hnorm = norm(h);
        disp([iterationer x y hnorm])
        iterationer = iterationer + 1;
    end
    plot(x, y, "O");
    P = [x; y];
    iter = iterationer;
    return;
end

function h = circle(x0,y0,r)
    hold on
    th = 0:pi/50:2*pi;
    xunit = r * cos(th) + x0;
    yunit = r * sin(th) + y0;
    h = plot(xunit, yunit);
    hold on;
end

