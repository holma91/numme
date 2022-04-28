close all
clear all


load('stockholmstemp')


plot(days, T, 'Color',[0,0.7,0.9])
xlabel('days')
ylabel('T')

d = days;

%% MKM
t = 110;
omega = 2*pi/365;
A = [ones(size(d)), d, sin(omega*(d-t))];
c = A\T;


hold on
plot(d, c(1) + c(2)*d + c(3)*sin(omega*(d-t)), 'r', 'LineWidth', 2);
grid
xlim([1, size(d, 1)])


%% Gauss-Newton

F = @(c) c(1) + c(2)*d + c(3)*sin(2*pi/365*(d-c(4))) - T;
J = @(c) [ones(size(d)), d, sin(2*pi/365*(d-c(4))), -2*pi/365*c(3)*cos(2*pi/365*(d-c(4)))];

diff = inf;
tol = 1e-6;
c = [6.7, 0.1, 9.2, 70]';

while diff > tol
    
     h = J(c)\F(c);
     c = c - h;
     diff = norm(h);
end
c

plot(d, c(1) + c(2)*d + c(3)*sin(omega*(d-c(4))), 'Color', [0,0.2,0.9], 'LineWidth', 2 );