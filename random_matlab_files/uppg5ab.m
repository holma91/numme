% solve Ax=b
% A = styvhetsmatris
% b innehaller krafter
% x innehaller forskjutningar
load eiffel1.mat
trussplot(xnod, ynod, bars)
hold on
b = zeros(522, 1);
b(522) = 1;
x = A\b;

xbel = xnod + x(1:2:end);
ybel = ynod + x(2:2:end);
% todo: vilken nod har vi valt?
plot(xnod(1, 1), ynod(1, 1), 'b*')

trussplot(xbel, ybel, bars, 'red')