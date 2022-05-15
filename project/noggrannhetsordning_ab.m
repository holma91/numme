
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
t0 = 0;
h = 0.002;
t = 4;

[pv_h, u_h] = RK4(ff, uStart, t0, h, t, 1);
[pv_h2, u_h2] = RK4(ff, uStart, t0, h, t, 2);
[pv_h4, u_h4] = RK4(ff, uStart, t0, h, t, 4);
[pv_h8, u_h8] = RK4(ff, uStart, t0, h, t, 8);



kvot1_x = abs(u_h(1) - u_h2(1))/abs(u_h2(1) - u_h4(1));
kvot2_x = abs(u_h2(1) - u_h4(1))/abs(u_h4(1) - u_h8(1));

kvot1_y = abs(u_h(2) - u_h2(2))/abs(u_h2(2) - u_h4(2));
kvot2_y = abs(u_h2(2) - u_h4(2))/abs(u_h4(2) - u_h8(2));

kvot1_norm = abs(vecnorm(u_h) - vecnorm(u_h2))/abs(vecnorm(u_h2) - vecnorm(u_h4));
kvot2_norm = abs(vecnorm(u_h2) - vecnorm(u_h4))/abs(vecnorm(u_h4) - vecnorm(u_h8));

disp("kvot1 x: " + kvot1_x);
disp("kvot2 x: " + kvot2_x);

disp("kvot1 y: " + kvot1_y);
disp("kvot2 y: " + kvot2_y);

disp("kvot1 norm: " + kvot1_norm);
disp("kvot2 norm: " + kvot2_norm);