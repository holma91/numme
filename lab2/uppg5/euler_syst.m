close all, clear all
% Exempel F9 - slide 27, 28
% Matlabkod som löser y'' = t - y' - y, y(0) = 1, y'(0) = 0
% Eulers metod med h = 0.1 till tid t = 5
% rita upp y(t) och y'(t)

f=@(t,v) [v(2); t-v(2)-v(1)]; % HL (kolonnevktor)

t0=0;  T=5;
h = 0.1;           % steglängd
n=(T-t0)/h;        % antal steg till sluttid
v=[1;0];          % begynnelsevektor


v_vek = zeros(n+1, 2); % spara resultat för alla tidssteg för att plotta
v_vek(1, :) = v;       % lägg in begynnelsevektorn i v_vek
t = t0;

% Eulers metod
for i=1:n
    v=v+h*f(t,v);  % ta fram värdet på v för nästa tidssteg
    t=t+h;         % uppdatera tiden
    
    v_vek(i+1, :) = v; % spara nuvarande värde på v - behövs bara för att plotta
end
 
plot(t0:h:T, v_vek)
xlabel('t')
legend('y', 'yprim')




