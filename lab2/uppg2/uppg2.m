% vi anvander gauss-newton darfor att vi har fler ekvationer an okanda
% 3 ekvationer, 2 okanda

Xa = [93; 63];
Xb = [6; 16];
Xc = [20, 83];
Xstart = [40.2837, 46.9689]; % startgissning, svaret fran lab1
La = 55.1;
Lb = 46.2;
Lc = 46.2;

[P, iter] = main(Xa, Xb, Xc, Xstart, La, Lb, Lc);
disp(P);
disp(iter);

% helper function for plotting circles
function h = plot_circle(x0,y0,r)
    hold on
    th = 0:pi/50:2*pi;
    x = r * cos(th) + x0;
    y = r * sin(th) + y0;
    h = plot(x, y);
    hold on;
end

function [P, iterationer] = main(Xa, Xb, Xc, Xstart, La, Lb, Lc)
    plot_circle(Xa(1), Xa(2), La);
    plot_circle(Xb(1), Xb(2), Lb);
    plot_circle(Xc(1), Xc(2), Lc);

    f = @(x,y) [La.^2 - (x-Xa(1)).^2 - (y - Xa(2)).^2;Lb.^2 - (x-Xb(1)).^2 - (y - Xb(2)).^2; Lc.^2 - (x-Xc(1)).^2 - (y - Xc(2)).^2];
    % JAKOBIAN!
    J = @(x,y) [-2*(x-Xa(1)) -2*(y-Xa(2)); -2*(x - Xb(1)) -2*(y - Xb(2)); -2*(x-Xc(1)) -2*(y-Xc(2))];
    
    x = Xstart(1);
    y = Xstart(2);
    
    tol = 1e-8; hnorm = 1; iterationer = 0;
    % gauss-newton
    while hnorm > tol
        h = -J(x,y)\f(x,y);
        x = x + h(1); 
        y = y + h(2);
        hnorm = norm(h);
        %disp([iterationer x y hnorm])
        iterationer = iterationer + 1;
    end
    plot(x, y, "O");
    P = [x; y];
end

% c) cirklarna går inte igenom punkten. P är den punkt där
% minstakvadratsumman är så liten som möjligt

