function K = upg4b 
h = 0.001; %steglängd
a = -2;
b = 2;
f = @(t) exp(1).^(-1*(t).^2) ;
t = a:h:b;
y = f(t);
K = h*(sum(y)-y(1)/2-y(end)/2);
end