r0=55.1;
r1=46.2;
x0=93;
y0=63;
x1=6;
y1=16;
theta = linspace(0,2*pi,100);
plot(x0 + r0*cos(theta), y0 + r0*sin(theta),'-')
hold on
plot(x1 + r1*cos(theta), y1 + r1*sin(theta), '-')
axis equal