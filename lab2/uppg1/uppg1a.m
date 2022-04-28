load dagdata.mat;

% skapa vandermonde matrisen
A = [ones(size(dag)) dag dag.^2 dag.^3 dag.^4 dag.^5 dag.^6 dag.^7 dag.^8 dag.^9 dag.^10 dag.^11];
c = A\timmar;

p = @(x) c(1) + c(2)*x + c(3)*x.^2 + c(4)*x.^3 + c(5)*x.^4 + c(6)*x.^5 + c(7)*x.^6 + c(8)*x.^7 + c(9)*x.^8 + c(10)*x.^9 + c(11)*x.^10 + c(12)*x.^11;

xv = [1:1:335];
pv = p(xv);
plot(dag,timmar,'o',xv,pv, 'LineWidth', 2)
xlabel('x');
ylabel('p(x)');

% vad är problemet?
% Warning: Matrix is close to singular or badly scaled. Results may be inaccurate. RCOND =  1.648071e-29.

