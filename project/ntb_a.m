c = 0.069;
v_vind = 5;
a = @(u) v_vind + 0.25*(u(5));
q = @(u) c*sqrt(u(2).^2 + (u(4) - a(u)).^2 + u(6).^2);
uStart = [0, 25*cos(pi/6), 0, 0, 1.5, 25*sin(pi/6)]';


% system av ODEs
ff = @(u) [
    u(2);
    -q(u)*u(2);
    u(4);
    -q(u)*(u(4) - a(u));
    u(6);
    -9.81 - q(u)*u(6);
];

t0 = 0;
h = 0.01;
t = 4;

[pv_h, u_h] = RK4(ff, uStart, t0, h, t, 1); % rk med h
[pv_h2, u_h2] = RK4(ff, uStart, t0, h, t, 2); % rk med h/2
[pv_h4, u_h4] = RK4(ff, uStart, t0, h, t, 4); % rk med h/4
[pv_h8, u_h8] = RK4(ff, uStart, t0, h, t, 8); % rk med h/8

disp("u_h: " + u_h);
disp("u_h2: " + u_h2);
disp("u_h4: " + u_h4);
disp("u_h8: " + u_h8);


