r0=55.1;
r1=46.2;
r2=46.2;
x0=93;
y0=63;
x1=6;
y1=16;
x2=20;
y2=83;
theta = linspace(0,2*pi,100);

% Parametisera cirkelns ekvation
plot(x0 + r0*cos(theta), y0 + r0*sin(theta),'-')
hold on
plot(x1 + r1*cos(theta), y1 + r1*sin(theta), '-')
hold on
plot(x2 + r2*cos(theta), y2 + r2*sin(theta), '-')
axis equal

% startgissningar (40, 50), (50, 30)