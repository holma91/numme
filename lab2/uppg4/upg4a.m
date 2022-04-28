
% använder oss av trapetsreglen för att räkna integral
% för 4a) h= 0.0001, a = -2, b = 2, f = @(t) exp(1).^(-1*(t).^2);

function K = upg4a(h)
    a = -2;
    b = 2;
    t = a:h:b;
    f = @(t) exp(1).^(-1*(t).^2);
    y = f(t);
    K = h*(sum(y)-y(1)/2-y(end)/2);
end
 % svar: 1.764162769314420

