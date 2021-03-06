v_vertikal = pi/6; % startgissning
v_medurs = pi/12; % startgissning
[plot_vec, vinkel1, vinkel2] = newton(v_vertikal, v_medurs);

% v_vertikal = pi/3; % startgissning
% v_medurs = -pi/6; % startgissning
% newton_sys(v_vertikal, v_medurs);

plot3(plot_vec(:, 1), plot_vec(:, 3), plot_vec(:, 5), '-');
xlabel('x');
ylabel('y');
zlabel('z');
grid on;
hold on;
plot3(6, 2, 0:0.01:3.5, '.');
disp(plot_vec(end, :));

function [plot_vec, vinkel1, vinkel2] = newton(v_vertikal, v_medurs)

    vinkel = [v_vertikal, v_medurs];

    h = inf;

    while norm(h) > 10^-8

        disp("h = " + h);
         
        % d is the interpolated point
        [~, nedslagsplats] = RK4WithInterpolation(vinkel(1), vinkel(2));
        
        F = [
            nedslagsplats(2) - 2;
            nedslagsplats(3) - 3.5;
        ];

        s = 0.0005; % why?

        % do rk4 again with small increase in v_vertikal
        [~, nedslagsplats_1] = RK4WithInterpolation(vinkel(1)+s, vinkel(2));

        %  do rk4 again with small increase in v_medurs
        [~, nedslagsplats_2] = RK4WithInterpolation(vinkel(1), vinkel(2)+s);
        
        J = (1/s).*[
            nedslagsplats_1(2)-nedslagsplats(2) nedslagsplats_2(2)-nedslagsplats(2)
            nedslagsplats_1(3)-nedslagsplats(3) nedslagsplats_2(3)-nedslagsplats(3)
        ];

        h = J\-F;
        vinkel = vinkel + h;
        
    end

    [plot_vec, ~] = RK4WithInterpolation(vinkel(1), vinkel(2));

    disp("pv = " + plot_vec);

    vinkel1 = vinkel(1);
    vinkel2 = vinkel(2);
    

end


function [plot_vec, nedslagsplats] = RK4WithInterpolation (v_vertikal, v_medurs)
    c = 0.069;
    v_vind = 5;
    a = @(u) v_vind + 0.25*(u(5));
    q = @(u) c*sqrt(u(2).^2 + (u(4) - a(u)).^2 + u(6).^2);
    
    ff = @(u) [
        u(2);
        -q(u)*u(2);
        u(4);
        -q(u)*(u(4) - a(u));
        u(6);
        -9.81 - q(u)*u(6);
    ];
    
    t0 = 0;
    h = 0.01/2;
    t = 1;
    N = (t - t0)/h;

    utkasthastighet = 15;
    pryl = [6; 2; 3.5];

    uStart = [
        0; utkasthastighet*cos(v_vertikal) * cos(v_medurs); 
        0; sin(v_medurs) * utkasthastighet * cos(v_vertikal); 
        1.5; utkasthastighet*sin(v_vertikal)
    ];
    
    u_vec = zeros(N+1, 6);
    u_vec(1, :) = uStart; 
    
    u = uStart;
    stop = 0;
    lock = false;
    
    for i = 1:N*2
        k1 = ff(u);
        k2 = ff(u + (h/2)*k1);
        k3 = ff(u + (h/2)*k2);
        k4 = ff(u + h*k3);
        
        u = u + h*(k1 + 2*k2 + 2*k3 + k4)/6;
        u_vec(i+1, :) = u;
    
    
        if u(1) > pryl(1) && lock == false
            lock = true;
            stop = i;
            break;
        end
    end
    
    if (stop > 0)
        vec = u_vec(1:stop, :);
    else
        vec = u_vec(:, :);
    end

    plot_vec = u_vec(1:stop + 1, :);

    % interpolation
    point1 = [vec(end, 1), vec(end, 3), vec(end, 5)]; % last point before x=xpryl
    point2 = [u(1), u(3), u(5)]; % first point after x=xpryl

    disp("p1="+point1);
    disp("p2="+point2);
    
    x = pryl(1); % target
    y = point1(2) + (x-point1(1)) * (point2(2) - point1(2))/(point2(1) - point1(1));
    z = point1(3) + (x-point1(1)) * (point2(3) - point1(3))/(point2(1) - point1(1));

    last_vec = [x, u(2), y, u(4), z, u(6)];

    plot_vec = u_vec(1:stop + 1, :);
    plot_vec(end, :) = last_vec;
    
    nedslagsplats = [x, y, z];

    disp("nsp = " + nedslagsplats);
    
        
end


