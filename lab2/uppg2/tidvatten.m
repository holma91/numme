t = (1:2:11)';
h = [1; 1.6; 1.4; 0.6; 0.2; 0.8]; %höjd
omega = 2*pi/12; % "gissning" för MKM

%%%% MKM

% bestäm koefficienter med minsta-kvadratmetod
A = [ones(size(t)) sin(omega*t)  cos(omega*t)];
c = A\h;

% ta fram kurva
g = @(t) c(1) + c(2)*sin(omega*t) + c(3)*cos(omega*t);
tt = (1:0.1:11)';

% plotta data och kurva
plot(t, h, 'mo', 'LineWidth', 3)
grid
hold on
plot(tt, g(tt), 'LineWidth', 2)

%% Gauss-Newton

g = @(c) c(1) + c(2)*sin(t*c(4)) + c(3)*cos(t*c(5));
% ?
F = @(c) [g(c) - h];
% bestam jakobianen
J = @(c) [ones(size(t)), sin(t*c(4)), cos(t*c(5)), c(2)*t.*cos(t*c(4)), -c(3)*t.*sin(t*c(5))];

J
% startgissning -> baserad på MKM lösning
c = [c; 0.5; 0.5]

diff = t;

while norm(diff) > 1e-6
   
    diff = J(c)\F(c)  % minsta-kvadratmetod
    c = c - diff;
    
end

%plotta kurva
g = @(c) c(1) + c(2)*sin(c(4)*tt) + c(3)*cos(c(5)*tt);
plot(tt, g(c))











