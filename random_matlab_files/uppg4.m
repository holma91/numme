
F = @(x)[x(1)^2+x(2)^2-186*x(1)-12*x(2)+93^2+6^2-(55.1)^2; 
    x(1)^2+x(2)^2-126*x(1)-32*x(2)+63^2+16^2-(46.2)^2];
J = @(x)[2*x(1)-186 2*x(2)-12;2*x(1)-126 2*x(2)-32];
x_vec = [2 ; 2]; % Startgissning


tol = 1e-5; hnorm = 1; iter = 0;
while hnorm > tol && iter < 20
    iter = iter + 1;
    h = -J(x_vec)\F(x_vec);
    x_vec = x_vec + h;
    hnorm = norm(h);
    disp([iter x_vec(1) x_vec(1) hnorm])
end