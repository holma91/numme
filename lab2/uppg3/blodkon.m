clear all; close all
% Exempel på minsta-kvadratmetoden med linjär ersättningsmodell
% Datapunkter
td = (1:10)';
cd = [6.2 9.5 12.3 13.9 14.6 13.5 13.3 12.7 12.4 11.9]';

% plotta data
figure(1)
plot(td, cd, 'mo', 'LineWidth', 3);
xlabel('t');
ylabel('c(t)');
grid on

%% anpassa linje till log. data
y = log(cd) - log(td);
figure(2)
plot(td, y, '*', 'LineWidth', 3);
A = [ ones(size(td)), td];
coeff = A\y;

k = coeff(1);
c2 = coeff(2);

linje = @(t) k + c2*t;
hold on
plot(td, linje(td))

%% gå tillbaka till originalmodellen
c1 = exp(k);
kurva = @(t) c1 * t.* exp(c2*t);

figure(1)
hold on
plot(td, kurva(td))



