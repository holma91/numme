c = 0.069;
v_vind = 5;
a = @(u) v_vind + 0.25*(u(5));
q = @(u) c*sqrt(u(2).^2 + (u(4) - a(u)).^2 + u(6).^2);

ff = @(t, u) [
    u(2);
    -q(u)*u(2);
    u(4);
    -q(u)*(u(4) - a(u));
    u(6);
    -9.81 - q(u)*u(6)
];

f = @(t, y) y*sin(t) - y^2;

t0 = 1;
T = 4;
N = 100;
h = (T-t0)/N;

y_rk4 = [];

for k = 1:3
    
    y = [0; 25*cos(pi/6); 0; 0; 1.5; 25*sin(pi/6)];
%     y = 2;
    t = t0;
    for i = 1:N
        k1 = ff(t, y);
        k2 = ff(t+h/2, y + h/2*k1);
        k3 = ff(t+h/2, y + h/2*k2);
        k4 = ff(t + h, y + h*k3);
        
        y = y + h*(k1 + 2*k2 + 2*k3 + k4)/6;
        t = t+h;    
    end

    disp("y= "+y);
    
    y_rk4 = [y_rk4, y];
%     disp(y_rk4);
        
    h = h/2;
    N = N*2;
    
    

end

%y_rk4
disp("y rk4: " + y_rk4);
diff_rk4 = abs(y_rk4(2:end) - y_rk4(1:end-1));
disp("diff rk4: " + diff_rk4);
diff_rk4(1)/diff_rk4(2)


% ode45
% [t, y] = ode45(f, [t0, 10], 2);
% plot(t, y, 'o');



