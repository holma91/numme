x = [1:4]';
y = [1 2 1 2]';
A = [ones(size(x)) x x.^2 x.^3];
c = A\y;
p = @(x) c(1) + c(2)*x + c(3)*x.^2 + c(4)*x.^3;
xv = [1:0.01:4];
pv = p(xv);
plot(x,y,'o',xv,pv, 'LineWidth', 2)
xlabel('x');
ylabel('p(x)');

[ones(size([1:7])) x x.^2 x.^3 x.^4 x.^5 x.^6 x.^7]