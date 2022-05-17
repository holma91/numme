format long



a = newtonsSystem(pi/3,pi/6)
hold on
% a = newtonsSystem(pi/3,-pi/6)
% a = rungekutta(pi/6,pi/16);
% plot(a)
% b = interpolationV(a)
function y = rungekutta(alfa, beta) 
    c = 0.069;
    v_vind = 5;
    t = 0;
    h = 0.005;
    v0 = [0
          15*cos(alfa)*cos(beta)
          0
          15*cos(alfa)*sin(beta)
          1.5
          15*sin(alfa)]';
    v = v0;
    u = [0,0,v(1),v(3),v(5)]; % ?
    y = [];
    i = 0;
    a = @(v) v_vind + 0.25*v(5);
    q = @(v) c*sqrt(v(2)^2 + (v(4) - a(v))^2 + v(6)^2);
    while v(1) < 6
        i = i + 1;
        % same f as always
        f = @(v) [v(2)
                 -1*q(v) * v(2)
                  v(4)
                 -1*q(v) * (v(4) - a(v))
                  v(6)
                 -9.81 - q(v)*v(6)]';
        % basic runge kutta
        k1 = f(v);
        k2 = f(v + (h*k1)/2);
        k3 = f(v +(h*k2)/2);
        k4 = f(v + h*k3);
        v = v + h*(k1 + 2*k2 + 2*k3 + k4)/6;
        t = t + h;
        u = [u; i, t, v(1), v(3), v(5)];
%         disp("u= " + u);
%         disp("-");
        y = [y; v];
    end
%     disp("y= " + y);
    y;
end

function x = newtonsSystem(alfa,beta)
    % tar in 2 vinklar
    x = [alfa
         beta];

    h = [1
         1];
    n = 1;
    while n > 10^-8
        % do RK4 med vinklarna, fa tillbaka en vektor med ALLA svar (fran
        % startvektor till endvektor)
        c = rungekutta(x(1),x(2));
%         disp("-");
%         disp("c= " + c);
%         disp("-");
        
        % interpolera c, d ar en enskild vektor, inte en matris
        d = interpolationV(c);
        
        % ekvationsystemet
        F = [d(3) - 2
             d(5) - 3.5];
        s = 0.001;
        % change vertikal vinkeln lite
        yza = interpolationV(rungekutta(x(1)+s,x(2)));
%         disp("-");
%         disp("yza= " + yza);
%         disp("-");
        % change medurs vinkeln lite
        yzb = interpolationV(rungekutta(x(1),x(2)+s));
        % changed below from c to d, approx 50x performance improvement
        J = (1/s).*[yza(3)-d(3) yzb(3)-d(3)
                   yza(5)-d(5) yzb(5)-d(5)];
        h = J\-F;
        x = x + h;
        n = norm(h);
    end
    disp("-");
    disp("x= " + x);
    disp("-");
    % x1 and x2 are the final angles
%     interpolationV(rungekutta(x(1),x(2)))
    plot(rungekutta(x(1),x(2)))
end

function a = interpolationV(v)
    yv = [];
    zv = [];
    xprimv = [];
    yprimv = [];
    zprimv = [];

    for i = length(v)-1:length(v)
        zv = [zv; v(i,1), v(i,5)];
        yv = [yv; v(i,1), v(i,3)];
        xprimv = [xprimv; v(i,1), v(i,2)];
        yprimv = [yprimv; v(i,1), v(i,4)];
        zprimv = [zprimv; v(i,1), v(i,6)];
    end
    z = linInterpolation(zv,6);
    y = linInterpolation(yv,6);
    xprim = linInterpolation(xprimv,6);
    yprim = linInterpolation(yprimv,6);
    zprim = linInterpolation(zprimv,6);
    a = [6
         xprim
         y
         yprim
         z
         zprim];
end



function u = linInterpolation(v,z)
    A = [1, v(1,1)
         1, v(2,1)];
    yv = [v(1,2)
          v(2,2)];

    c = A\yv;
    f = @(x) c(1) + c(2)*x;
    u = f(z);
end

function plot(v)
    for i = 1:length(v)
        plot3(v(i,1),v(i,3),v(i,5),'.')
        hold on
        fill3([0,0,6,6],[0,4,4,0],[0,0,0,0],'g')
        fill3([0,0,0,0],[0.5,0.5,0,0],[0,1.5,1.5,0],'b')
        fill3([6,6,6,6],[2,2,2.1,2.1],[0,3.5,3.5,0],'b')
        axis equal
    end
end