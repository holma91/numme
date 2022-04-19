load dagdata.mat;
% xd = [1 2 4]'; dag
% yd = [1 2 3]'; timmar
A = [ones(size(dag)) dag dag.^2];

% ger mkm losning ifall A ar overbestamd
c = A\timmar;

r = A*c - timmar; % berakna residualvektor
felsumma = norm(r)^2; % felsumman i kvadrat

% bilda modellen
% ym = @(x) c(1) + c(2)*x;
T = 365;
w = 2*pi/T;
ym = @(t) c(1) + c(2) * cos(w*t) + c(3) * sin(w*t);

% berakna modellen i mellanliggande punkter
xv = [1:0.01:365];
yv = ym(xv);

plot(dag,timmar,'o',xv,yv,"LineWidth",2)
xlabel('x'); ylabel('ym(x)')