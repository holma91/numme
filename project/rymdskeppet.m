
    
g = 20;
alpha = pi/2; % vinkel
R = 1; % jordradie
HStart = 2;

F = @(G, u) [
    u(2);
    G*cos(alpha) - g*(R^2)/(u(1)^2)+u(1)*u(4)^2;
    u(4);
    (G*sin(alpha)-2*u(2)*u(4))/u(1);
];

uStart = [0, 0, 0, 0]';

H = Hstart;

t0 = 1;
T = 4;
N = 100;
h = (T-t0)/N;

for i = 1:N
    G = (g*R^2)/(R+H)^2;
    k1 = f(G, uStart);
    k2 = f(t+h/2, y + h/2*k1);
    k3 = f(t+h/2, y + h/2*k2);
    k4 = f(t + h, y + h*k3);
    
    y = y + h*(k1 + 2*k2 + 2*k3 + k4)/6;
    t = t+h;    
end



    
    
