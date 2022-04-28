clear all, close all
f = @(x) cos(2*pi*x) + x^2;
fprim = @(x) -2*pi*sin(2*pi*x) + 2*x; % exakt derivata, som referens

x0 = 3.1;
fp3 = fprim(x0); %referenslösning - exakt derivata i x
h = 0.1;

N = 10;
fel_fram = zeros(N, 1);
fel_bak = zeros(N, 1);
fel_central = zeros(N, 1);
hvek = [];


for i = 1:N

    hvek = [hvek, h];

    %framåtdifferens
    fp_fram = (f(x0+h) - f(x0))/h;
    fel_fram(i) = abs(fp_fram - fp3);

    %bakåtdifferens
    fp_bak = (f(x0) - f(x0-h))/h;
    fel_bak(i) = abs(fp_bak - fp3);

    %centraldifferens
    fp_central = (f(x0+h) - f(x0-h))/(2*h);
    fel_central(i) = abs(fp_central - fp3);

    h = h/2;

end

% plotta fel med logaritmisk skala
loglog(hvek, fel_fram,'LineWidth', 2)
hold on
loglog(hvek, fel_bak, '-.', 'LineWidth', 2)
loglog(hvek, fel_central, 'LineWidth', 2)
loglog(hvek, 5*hvek, 'k--')
loglog(hvek, 1e1*hvek.^2, 'k-.')
grid on
xlabel('h')
ylabel('fel')
ylim([1e-7, 1e1])
legend('framåt', 'bakåt', 'central', 'C h', 'C h^2', 'FontSize', 12)


% tabell med felvärden
hvek = hvek';
fprintf(['    h         fel_fram  fel_bak   fel_central\n'])
disp([hvek, fel_fram, fel_bak, fel_central])

