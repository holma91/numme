% startvarden

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

% startposition
x0 = 0;
y0 = 0;
z0 = 1.5; 
v0 = 25; % vindhastighet
v_utkast = pi/6; % vertikala utkastvinkeln

t0 = 0;
h = 0.002;
t = 4;

% startgissningar
vinkel_0 = 0;
vinkel_1 = pi/2;

tol = 1e-5;

while abs(vinkel_1-vinkel_0) > tol

    % begynnelsevarden, omskrivna till polara koordinater
    % nagot kan vara fel har
    BV0 = [x0 v0*sin(pi/2-v_utkast)*cos(-vinkel_0) y0 v0*sin(pi/2-v_utkast)*sin(-vinkel_0) z0 v0*cos(pi/2-v_utkast)]';
    BV1 = [x0 v0*sin(pi/2-v_utkast)*cos(-vinkel_1) y0 v0*sin(pi/2-v_utkast)*sin(-vinkel_1) z0 v0*cos(pi/2-v_utkast)]';

    % gor rungekutta for varje vinkel
    [plot_vec0, nedslagsplats0] = RK4(ff, BV0, t0, h, t);
    [plot_vec1, nedslagsplats1] = RK4(ff, BV1, t0, h, t);

    % vilket y-varde landar vi pa?
    % hur gor vi sa att y gar mot 0?
    y0 = nedslagsplats0(2);
    y1 = nedslagsplats1(2);

    % sekantmetoden
    vinkel_2 = vinkel_1-(y1*(vinkel_1-vinkel_0))/(y1-y0); 
    vinkel_0 = vinkel_1;
    vinkel_1 = vinkel_2;

    disp("nedslagsplats0:");
    disp(nedslagsplats0);

    disp("nedslagsplats1:");
    disp(nedslagsplats1);

end


