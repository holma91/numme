% xa = 93;
% ya = 6;
% f = @(xp, yp) (xa - xp)^2 + (ya - yp)^2 - (55.1)^2;
% fimplicit(f)
% axis equal

%// radius
r = 55.1;

%// center
c = [3 3];

%// number of points
n = 1000;

%// running variable
t = linspace(0,2*pi,n);

x = c(1) + r*sin(t);
y = c(2) + r*cos(t);

%// draw line
line(x,y)

%// or draw polygon if you want to fill it with color
%// fill(x,y,[1,1,1])
axis equal