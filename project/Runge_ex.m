clear all
close all

f = @(x) 2*exp(-x.^2/0.05);
N = 14;
x = linspace(-1,1,N+1)';
y = f(x);


%
c = polyfit(x, y, N);


% Rita upp punkterna samt det interpolerande polynomet
xv = [-1:0.01:1];
pv = polyval(c, xv);

figure()
plot(x,y,'ko',xv,pv,'r', xv,f(xv),'b', 'LineWidth',2)
xlabel('x')
grid on
legend('', 'p(x)', 'f(x)')
title(['n = ', num2str(N)])

%% Chebyshev nodes
k = 1:N+1;
xcheb = cos((2*k - 1)/(2*(N+1))*pi);
ycheb = f(xcheb);

c = polyfit(xcheb, ycheb, N);


% Rita upp punkterna samt det interpolerande polynomet

xv = [-1:0.01:1];
pv = polyval(c, xv);

figure()
plot(xcheb,ycheb,'ko',xv,pv,'r', xv,f(xv),'b', 'LineWidth',2)
xlabel('x')
grid on
legend('', 'p(x)', 'f(x)')
title(['Chebyshev punkter,  n = ', num2str(N)])


%% 
figure()
yy = interp1(x, y, xv, 'linear');
plot(x,y,'ko',xv, yy,'r', xv,f(xv),'b', 'LineWidth',2)
xlabel('x')
grid on
legend('', 'p(x)', 'f(x)')
title(['Pw linear, n = ', num2str(N)])

%%
%%
figure()
yy = interp1(x, y, xv, 'spline');
plot(x,y,'ko',xv, yy,'r', xv,f(xv),'b', 'LineWidth',2)
xlabel('x')
grid on
legend('', 'p(x)', 'f(x)')
title(['Spline, n = ', num2str(N)])
