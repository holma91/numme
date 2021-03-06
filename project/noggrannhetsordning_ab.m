
% u_h = [pv_h(end-1, 1) pv_h(end-1, 3) pv_h(end-1, 5)];
% u_h2 = [pv_h2(end-1, 1) pv_h2(end-1, 3) pv_h2(end-1, 5)];
% u_h4 = [pv_h4(end-1, 1) pv_h4(end-1, 3) pv_h4(end-1, 5)];
% u_h8 = [pv_h8(end-1, 1) pv_h8(end-1, 3) pv_h8(end-1, 5)];
% disp(u_h2);
% h
% (18.646013485055498, 6.496194519284152, 0)

% h/2
% (18.644368286972842, 6.497231291004769, 0)

% h/4
% (18.643534193333814, 6.497745735408627,  0)

% h/8
% (18.643114272485981, 6.498001971222281, 0)

% u_h = [18.646013485055498, 6.496194519284152];
% u_h2 = [18.644368286972842, 6.497231291004769];
% u_h4 = [18.643534193333814, 6.497745735408627];
% u_h8 = [18.643114272485981, 6.498001971222281];
% ~
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

% t0 = 0;
% t = 4;
% N = 200;
% h = (t-t0)/N;

t0 = 0;
h = 0.01;
t = 1;

N = (t - t0)/h;

[pv_h, u_h] = RK4(ff, uStart, t0, h, t, 1, N); % rk med h
h = h/2;
[pv_h2, u_h2] = RK4(ff, uStart, t0, h, t, 2, N); % rk med h/2
h = h/4;
[pv_h4, u_h4] = RK4(ff, uStart, t0, h, t, 4, N); % rk med h/4
h = h/8;
[pv_h8, u_h8] = RK4(ff, uStart, t0, h, t, 8, N); % rk med h/8

%disp(pv_h);

u_h = [pv_h(end-1, 1) pv_h(end-1, 3) pv_h(end-1, 5)];
u_h2 = [pv_h2(end-1, 1) pv_h2(end-1, 3) pv_h2(end-1, 5)];
u_h4 = [pv_h4(end-1, 1) pv_h4(end-1, 3) pv_h4(end-1, 5)];
u_h8 = [pv_h8(end-1, 1) pv_h8(end-1, 3) pv_h8(end-1, 5)];

disp("u_h: " + u_h);
disp("u_h2: " + u_h2);
disp("u_h4: " + u_h4);
disp("u_h8: " + u_h8);


kvot1_x = abs(u_h(1) - u_h2(1))/abs(u_h2(1) - u_h4(1));
kvot2_x = abs(u_h2(1) - u_h4(1))/abs(u_h4(1) - u_h8(1));

kvot1_y = abs(u_h(2) - u_h2(2))/abs(u_h2(2) - u_h4(2));
kvot2_y = abs(u_h2(2) - u_h4(2))/abs(u_h4(2) - u_h8(2));

kvot1_z = abs(u_h(3) - u_h2(3))/abs(u_h2(3) - u_h4(3));
kvot2_z = abs(u_h2(3) - u_h4(3))/abs(u_h4(3) - u_h8(3));


kvot1 = abs(u_h - u_h2)/abs(u_h2 - u_h4);
kvot2 = abs(u_h2 - u_h4)/abs(u_h4 - u_h8);

disp("kvot1: " + kvot1);

kvot1_norm = abs(vecnorm(u_h) - vecnorm(u_h2))/abs(vecnorm(u_h2) - vecnorm(u_h4));
kvot2_norm = abs(vecnorm(u_h2) - vecnorm(u_h4))/abs(vecnorm(u_h4) - vecnorm(u_h8));

% kvotfan ska bli 16, blir typ 2

disp("kvot1 x: " + kvot1_x);
% disp("kvot2 x: " + kvot2_x);

disp("kvot1 y: " + kvot1_y);
% disp("kvot2 y: " + kvot2_y);

disp("kvot1 z: " + kvot1_z);
% disp("kvot2 z: " + kvot2_z);

% disp("kvot1 norm: " + kvot1_norm);
% disp("kvot2 norm: " + kvot2_norm);
