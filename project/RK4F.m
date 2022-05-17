%% RK4 with Interpolation


function [plot_vec, nedslagsplats] = RK4F (ff, uStart, h, N, pryl)
    
    u_vec = zeros(N+1, 6); % spara resultat för alla tidssteg för att plotta
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
    
    x = pryl(1); % target
    y = point1(2) + (x-point1(1)) * (point2(2) - point1(2))/(point2(1) - point1(1));
    z = point1(3) + (x-point1(1)) * (point2(3) - point1(3))/(point2(1) - point1(1));


    last_vec = [x, u(2), y, u(4), z, u(6)];

    plot_vec = u_vec(1:stop + 1, :);
%     plot_vec(end, :) = last_vec;
    
    nedslagsplats = [x, y, z];
    
        
end