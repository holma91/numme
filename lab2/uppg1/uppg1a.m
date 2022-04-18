load dagdata.mat;

% skapa vandermonde matrisen
A = [ones(size(dag)) dag dag.^2 dag.^3 dag.^4 dag.^5 dag.^6 dag.^7 dag.^8 dag.^9 dag.^10 dag.^11 dag.^12];

% dag2 = dag(1:4);
% A = [ones(size(dag2)) dag2 dag2.^2 dag2.^3];
% timmar2 = timmar(1:4);
c = A\timmar;

% genom att studera tabellen kan man se att polynomet ska vara av grad 2
p = @(x) c(1) + c(2)*x + c(3)*x.^2;

xv = [1:1:365];
pv = p(xv);
plot(dag,timmar,'o',xv,pv, 'LineWidth', 2)
xlabel('x');
ylabel('p(x)');

% vid plotten kan man se att punkterna ligger pa ratt stallen, 
% men kurvan ligger hela tiden i y = 0. Varfor? Tror att vara nummer 
% overflowar vid p(xv) vilket gor att vi far fullt av negativa tal i pv
% testa byt ut dag mot dag2 och timmar mot timmar2 och kor, da funker det