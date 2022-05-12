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
v0 = 25; % hastighet
v_utkast = pi/6; % vertikala utkastvinkeln

t0 = 0;
h = 0.002;
t = 4;

% startgissningar
vinkel_0 = 0;
vinkel_1 = pi/2;
diffx = inf;
tol = 1e-10;

while abs(vinkel_1 - vinkel_0) > tol
    

    % begynnelsevarden
    vv0 = [0; cos(vinkel_0) * cos(v_utkast) * 25; 0; -(sin(vinkel_0) * 25 * cos(v_utkast)); 1.5; sin(v_utkast)* 25];
    vv1 = [0; cos(vinkel_1) * cos(v_utkast) * 25; 0; -(sin(vinkel_1) * 25 * cos(v_utkast)); 1.5; sin(v_utkast)* 25];

    % gor rungekutta for varje vinkel
    [plot_vec0, nedslagsplats0] = RK4(ff, vv0, t0, h, t);
    [plot_vec1, nedslagsplats1] = RK4(ff, vv1, t0, h, t);

    % vilka y-varden landar vi pa?
    y0 = nedslagsplats0(2);
    y1 = nedslagsplats1(2);

    % sekantmetoden
    vinkel_0_prev = vinkel_0;
    vinkel_0 = vinkel_1;
    vinkel_1 = vinkel_1-((y1*(vinkel_1-vinkel_0_prev))/(y1-y0));

    disp([vinkel_0 vinkel_1 vinkel_1 - vinkel_0]);

end

disp("vinkel:");
disp(vinkel_1); % 0.3753 radianer = 21.50 grader
disp("nedslagsplats1:");
disp(nedslagsplats1); % (16.5962, 0, 0)
plot3(plot_vec1(:, 1), plot_vec1(:, 3), plot_vec1(:, 5), '-');
xlabel('x');
ylabel('y');
zlabel('z');
grid on;


