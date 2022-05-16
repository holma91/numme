c = 0.069;
v_vind = 5;
a = @(u) v_vind + 0.25*(u(5));
q = @(u) c*sqrt(u(2).^2 + (u(4) - a(u)).^2 + u(6).^2);
uStart = [0; 25*cos(pi/6); 0; 0; 1.5; 25*sin(pi/6)];

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
h = 0.01/4;
t = 1;
N = (t - t0)/h;

[plot_vec, nedslagsplats] = RK4(ff, uStart, h, N);

% a)
plot3(plot_vec(:, 1), plot_vec(:, 3), plot_vec(:, 5), '-');
xlabel('x');
ylabel('y');
zlabel('z');
grid on;

% b)
disp("nedslagsplats:");
disp(nedslagsplats);
disp("vec:");
% disp(plot_vec);
% 
% hh = 0.019593967270485;
% hh2 = 0.019593980899920;
% hh4 = 0.019593981736266;
% disp(abs(hh - hh2)/abs(hh2 - hh4));





