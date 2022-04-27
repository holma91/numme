%% start a) med naiv ansats

x = [1 32 60 91 121 152 182 213 244 274 305 335]';
y = [6.2000 8.1000 10.3000 13.2000 15.5000 18 18.3000 16.4000 14.1000 11.3000 8.5000 6.4000]';

Aa=[ones(size(x)) x x.^2 x.^3 x.^4 x.^5 x.^6 x.^7 x.^8 x.^9 x.^10 x.^11];

c = Aa\y;

% interpolerar med naiv ansats
% interpolation får bara ske mellan punkterna

p = @(x) c(1) + c(2)*x + c(3)*x.^2 + c(4)*x.^3 + c(5)*x.^4 + c(6)*x.^5 + c(7)*x.^6 + c(8)*x.^7 + c(9)*x.^8 + c(10)*x.^9 + c(11)*x.^10 + c(12)*x.^11;

xv = [1:1:365]; pv = p(xv);

plot (x, y, 'o', xv, pv, 'LineWidth', 2)
xlabel('x'); ylabel('p(x)')
