function vinkel_1 = vindkast_c(v_vind, v0, plot_bana)
    c = 0.069;
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
    
    % startposition
    x0 = 0;
    y0 = 0;
    z0 = 1.5; 
    v_utkast = pi/6; % vertikala utkastvinkeln
    
    t0 = 0;
    h = 0.01/2;
    t = 1;
    N = (t - t0)/h;
    
    % startgissningar
    vinkel_0 = 0;
    vinkel_1 = pi/2;
    tol = 1e-10;
    
    while abs(vinkel_1 - vinkel_0) > tol
        
    
        % begynnelsevarden
        vv0 = [x0; cos(vinkel_0) * cos(v_utkast) * v0; y0; -(sin(vinkel_0) * v0 * cos(v_utkast)); z0; sin(v_utkast)* v0];
        vv1 = [x0; cos(vinkel_1) * cos(v_utkast) * v0; y0; -(sin(vinkel_1) * v0 * cos(v_utkast)); z0; sin(v_utkast)* v0];
    
        % gor rungekutta for varje vinkel
        [~, nedslagsplats0] = RK4(ff, vv0, h, N);
        [plot_vec1, nedslagsplats1] = RK4(ff, vv1, h, N);
    
        % vilka y-varden landar vi pa?
        y_nedslag_0 = nedslagsplats0(2);
        y_nedslag_1 = nedslagsplats1(2);
    
        % sekantmetoden
        vinkel_0_prev = vinkel_0;
        vinkel_0 = vinkel_1;
        vinkel_1 = vinkel_1-((y_nedslag_1*(vinkel_1-vinkel_0_prev))/(y_nedslag_1-y_nedslag_0));
    
    end

    if plot_bana
        disp("vinkel:");
        disp(vinkel_1);
        disp("nedslagsplats1:");
        disp(nedslagsplats1); % (16.5962, 0, 0)
        plot3(plot_vec1(:, 1), plot_vec1(:, 3), plot_vec1(:, 5), '-');
        xlabel('x');
        ylabel('y');
        zlabel('z');
        grid on;
    end

end

% 21.50311 in degrees, 0.3753 in radians

