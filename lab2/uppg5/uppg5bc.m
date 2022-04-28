theta = [1.1901; 0.3807];
alfa = 3;
beta = 0.7;
gamma = 4;
w = 3*pi;

% system av ODE:s i vektorform
f = @(t,v) [
    v(2); 
    -alfa*(v(1)-theta(1))-gamma*v(2)+beta*sin(w*t);
    v(3);
    -alfa*(v(3)-theta(2))-gamma*(v(4)+abs(v(2)))+beta*sin(w*t)
    ];


v = [pi/2; 0; pi/6; 0]; % begynnelsevektor
% v = [0; 0]; % begynnelsevektor

t0 = 0;
% T = 15;
T = 30;
h = 0.005; % steglängd
n = (T-t0)/h; % antal steg till sluttid

% spara resultat för alla tidssteg för att plotta
v_vek = zeros(n+1, 4);

% lägg in begynnelsevektorn i starten av v_vek
v_vek(1, :) = v;
t = t0;

% Eulers metod
for i=1:n
    v=v+h*f(t,v);  % ta fram värdet på v för nästa tidssteg
    t=t+h;         % uppdatera tiden
    
    v_vek(i+1, :) = v; % spara nuvarande värde på v - behövs bara för att plotta
    if (mod(i, 10)==1)
        plot_robotarm(v(1:2))
    end
end
