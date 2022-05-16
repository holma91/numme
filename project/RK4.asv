%% RK4 with Interpolation


function [plot_vec, nedslagsplats, u_vec] = RK4 (ff, uStart, t0, h, t, h_divided_by, N)
%     N = (t - t0)/(h/h_divided_by);
%     disp("N = " + N);
    
    u_vec = zeros(N+1, 6); % spara resultat för alla tidssteg för att plotta
    u_vec(1, :) = uStart; 
    
    u = uStart;
    stop = 0;
    lock = false;
    
    for i = 1:N
        k1 = ff(u);
        k2 = ff(u + (h/h_divided_by)*k1);
        k3 = ff(u + (h/h_divided_by)*k2);
        k4 = ff(u + h*k3);
        
        u = u + h*(k1 + 2*k2 + 2*k3 + k4)/6;
%         disp(u);
        u_vec(i+1, :) = u;
    
    
        if u(5) < 0 && lock == false
            lock = true;
            stop = i;
%             break;
        end
    end
    
    if (stop > 0)
        vec = u_vec(1:stop, :);
    else
        % means that z never got below 0
        disp("N in else: " + N);
        vec = u_vec(:, :);
    end

    disp(u_vec);

    % interpolation
    point1 = [vec(end, 1), vec(end, 3), vec(end, 5)]; % last point before z=0
    point2 = [u(1), u(3), u(5)]; % first point after z=0
    
    z = 0;
    x = point1(1) + (z-point1(3)) * (point2(1) - point1(1))/(point2(3) - point1(3));
    y = point1(2) + (z-point1(3)) * (point2(2) - point1(2))/(point2(3) - point1(3));

    last_vec = [x, u(2), y, u(4), z, u(6)];

    plot_vec = u_vec(1:stop + 1, :);
    plot_vec(end, :) = last_vec;
    
    nedslagsplats = [x, y, z];
    
        
end