close all
B = 1000;
C = 0.5;
Y0 = 100;
f = @(t, y) C*y*(1-y/B); %kan hopppa över t i det här exemplet

% steglängd, antal tidsintervall
N = 50;
tstart = 0;
Tend = 10;
h = (Tend - tstart)/N;

y = zeros(N+1, 1);
y(1) = Y0; % begynnelsevärde

yendvek = zeros(3, 1); % spara resultat y(Tend)

% 3 iterationer, varje iteration ger ett svar till yendvek
% vi halverar h i slutet av varje iteration
for k = 1:3
% vektor för alla tidpunkter
    t = tstart:h:Tend;
    N = size(t, 2)-1; % returns the dimension for t which is 200
    
    
    for i = 1:N
    
        y(i+1) = y(i) + h*f(t(i), y(i));
            
    end
    
    
    plot(t, y, 'LineWidth', 3)
    xlabel('tid')
    ylabel('y')
    ylim([0, 1100])
    hold on
    
    yendvek(k) = y(Tend);
    h  = h/2;

end

 %plotta exakt lösning för att jämföra
 K = log(Y0/(B - Y0));
 y_exakt = @(t) B*exp(C*t + K)./(1 + exp(C*t + K));
 hold on
 plot(t, y_exakt(t), 'LineWidth', 2)
 
fel_approx = abs(yendvek(2:3) - yendvek(1:2));
fel_approx(1)/fel_approx(2)




