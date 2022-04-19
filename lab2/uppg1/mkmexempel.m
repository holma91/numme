xd = [1 2 4]';
yd = [1 2 3]';
A = [ones(size(xd)) xd];

% ger mkm losning ifall A ar overbestamd
c = A\yd;

r = A*c - yd; % berakna residualvektor
felsumma = norm(r)^2; % felsumman i kvadrat

% bilda modellen
ym = @(x) c(1) + c(2)*x;

% berakna modellen i mellanliggande punkter
xv = [1:0.01:5];
yv = ym(xv);

plot(xd,yd,'o',xv,yv,"LineWidth",2)
xlabel('x'); ylabel('ym(x)')


