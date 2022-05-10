

c = 0.069;
v_vind = 5;
a = @(z) v_vind + 0.25*(z);
q = @(u) c*sqrt(u(2)^2 + (u(4) - a(u(5))^2) + u(6)^2);

f = @(u) [
    u(2);
    -q(u)*u(2);
    u(4);
    -q(u)*(u(4) - a(u(5)));
    u(6);
    -9.81 - q(u)*u(6);
];

uStart = [0, 25*cos(pi/6), 0, 0, 1.5, 25*sin(pi/6)]';


N = 105;
h = 0.02;

u_vek = zeros(N+1, 6); % spara resultat för alla tidssteg för att plotta
u_vek(1, :) = uStart; 

u = uStart;
stop = 0;
lock = false;
for i = 1:N
    k1 = f(u);
    k2 = f(u + h/2*k1);
    k3 = f(u + h/2*k2);
    k4 = f(u + h*k3);
    
    u = u + h*(k1 + 2*k2 + 2*k3 + k4)/6;
    u_vek(i+1, :) = u;

    if u(5) < 0 && lock == false
        stop = i;
        lock = true;
    end
end

plot_vek = u_vek(1:stop, :);

plot3(plot_vek(:, 1), plot_vek(:, 3), plot_vek(:, 5), '-');
xlabel('x');
ylabel('y');
zlabel('z');
grid on;

    
    
