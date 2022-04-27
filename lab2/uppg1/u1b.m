%% start b)

xd = [1 32 60 91 121 152 182 213 244 274 305 335]';
yd = [6.2000 8.1000 10.3000 13.2000 15.5000 18 18.3000 16.4000 14.1000 11.3000 8.5000 6.4000]';

Ab = [ones(size(xd)) xd xd.^2];

%% Löser systemet för modellends koefficienter
c = Ab\yd;
T = 365;
w = (2*pi)/T;

r = Ab*c - yd; % residualvektor
felsumma = norm(r)^2; % felsumman i kvadrat

% Modell som anonym funktion
ym = @(t) c(1) + c(2)*cos(w*t) + c(3)*sin(w*t);

% Modellen i mellanliggande punkter
xv = 1:1:365;
yv = ym(xv);

% Plotta punkterna & modell
plot(xd, yd, 'o', xv, yv, 'LineWidth', 2)
xlabel('x'); ylabel('ym(x)')
