load dagdata.mat;
T = 365;
w = 2*pi/T;
A = [ones(size(dag)) cos(w * dag) sin(w * dag)];

% ger mkm losning ifall A ar overbestamd
c = A\timmar;

r = A*c - timmar; % berakna residualvektor
felsumma = norm(r)^2; % felsumman i kvadrat

% bilda modellen
ym = @(t) c(1) + c(2) * cos(w*t) + c(3) * sin(w*t);

% berakna modellen i mellanliggande punkter
xv = [1:1:365];
yv = ym(xv);

plot(dag,timmar,'o',xv,yv,"LineWidth",2)
xlabel('x'); ylabel('ym(x)')