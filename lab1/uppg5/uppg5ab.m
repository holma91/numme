%{
uppgift a):
solve Ax=b
A = styvhetsmatris
b innehaller krafter
x innehaller forskjutningar
%}
load eiffel1.mat
trussplot(xnod, ynod, bars)
hold on

% uppgift b):
b = zeros(522, 1);
b(521) = 1;

x = A\b;

xbel = xnod + x(1:2:end);
ybel = ynod + x(2:2:end);

trussplot(xbel, ybel, bars, 'red')
hold on
plot(xnod(261), ynod(261), "blue*")