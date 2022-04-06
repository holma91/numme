
f=@(x) [x(1)+x(2)^2; -1+x(1)^2+4*x(2)];
J=@(x) [1 , 2*x(2); 2*x(1), 4];

h=inf;
TOL=1e-10;
x=[0;0];

while (norm(h)>TOL)
    h=J(x)\f(x);
    x=x-h;
    disp(x);
end