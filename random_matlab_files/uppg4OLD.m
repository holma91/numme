F = @(x,y)[x^2+y^2-186*x-12*y+93^2+6^2-(55.1)^2; x^2+y^2-126*x-32*y+63^2+16^2-(46.2)^2];
La = 55.1;
Lb = 46.2;

J = @(x,y)[2*x-186 2*y-12;2*x-126 2*y-32];
x = 20; y = 20; % Startgissning

tol = 1e-5; hnorm = 1; iter = 0;
while hnorm > tol && iter < 20
    iter = iter + 1;
    h = -J(x,y)\F(x,y);
    x = x + h(1);
    y = y + h(2);
    hnorm = norm(h);
    disp([iter x y hnorm])
end