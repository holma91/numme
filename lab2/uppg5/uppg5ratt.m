% u(1)' =  u(2)
% u(2)' = -a*(u(1)-tx(1))-y*u(2)+B*sin(w*t)
% u(3)' =  u(4)
% u(4)' = -a*(u(3)-tx(2))-y*(u(1)+|u(2)|)+B*sin(w*t)


%% 5b

tx = [1.190051800421149, 0.380744526373749];
y = 4; % Gamma, Friktion
B = 0.7; % Beta, Vibrationsamplitud
w = 3*pi; % Omega, Vibrationsfrekvens
a = 3; % Alpha, parameter

F = @(t, u) [
    u(2);
    -a*(u(1)-tx(1))-y*u(2)+B*sin(w*t);
    u(4);
    -a*(u(3)-tx(2))-(y*(u(4)+abs(u(2))))+B*sin(w*t);
];

h = 0.005;
t0 = 0; T = 15;
n = (T-t0)/h;

ustart = [pi/2, 0, pi/6, 0]';
u_vek = zeros(n+1, 4);
u_vek(1, :) = ustart;


u = ustart;
t = t0;
for i = 1:n
    u = u+h*F(t, u);
    t = t+h;

    u_vek(i+1, :) = u;

    if (mod(i, 10) == 1) 
        plot_robotarm([u(1), u(3)])
    end
end

% xend = 1.32112
% yend = 1.24313