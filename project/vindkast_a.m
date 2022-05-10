c = 0.069;
v_vind = 5;
a = @(u) v_vind + 0.25*(u(5));
q = @(u) c*sqrt(u(2).^2 + (u(4) - a(u)).^2 + u(6).^2);

ff = @(u) [
    u(2);
    -q(u)*u(2);
    u(4);
    -q(u)*(u(4) - a(u));
    u(6);
    -9.81 - q(u)*u(6);
];

uStart = [0, 25*cos(pi/6), 0, 0, 1.5, 25*sin(pi/6)]';


t0 = 0;
h = 0.002;
t = 4;

N = (t - t0)/h;

u_vek = zeros(N+1, 6); % spara resultat för alla tidssteg för att plotta
u_vek(1, :) = uStart; 

u = uStart;
stop = 0;

for i = 1:N
    k1 = ff(u);
    k2 = ff(u + h/2*k1);
    k3 = ff(u + h/2*k2);
    k4 = ff(u + h*k3);
    
    u = u + h*(k1 + 2*k2 + 2*k3 + k4)/6;
    u_vek(i+1, :) = u;

    disp([u(1), u(3), u(5)]);

    if u(5) < 0
        stop = i;
        break;
    end
end

plot_vek = u_vek(1:stop, :);

plot3(plot_vek(:, 1), plot_vek(:, 3), plot_vek(:, 5), '-');
xlabel('x');
ylabel('y');
zlabel('z');
grid on;