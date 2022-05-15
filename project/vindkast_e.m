c = 0.069;
v_vind = 5;
v0 = 25;
a = @(u) v_vind + 0.25*(u(5));
q = @(u) c*sqrt(u(2).^2 + (u(4) - a(u)).^2 + u(6).^2);
vinkel = 0.3753; % vinkeln fran c)
v_utkast = pi/6; % vertikala utkastvinkeln
dampnings_faktor = 0.8;

ff = @(u) [
    u(2);
    -q(u)*u(2);
    u(4);
    -q(u)*(u(4) - a(u));
    u(6);
    -9.81 - q(u)*u(6);
];

uStart = [0; cos(vinkel) * cos(v_utkast)*v0; 0; -(sin(vinkel) * v0 * cos(v_utkast)); 1.5; sin(v_utkast) * v0];

t0 = 0;
h = 0.002;
t = 100;
N = (t - t0)/h;

u_vec = zeros(N+1, 6);
u_vec(1, :) = uStart; 

u = uStart;

bounceCounter = 0;
stop = 0;
for i = 1:N
    k1 = ff(u);
    k2 = ff(u + h/2*k1);
    k3 = ff(u + h/2*k2);
    k4 = ff(u + h*k3);
    
    u = u + h*(k1 + 2*k2 + 2*k3 + k4)/6;
    u_vec(i+1, :) = u;

    % check previous z value to avoid it being negative two times in a row
    if u(5) < 0 && u_vec(i, 5) > 0
        u(2) = dampnings_faktor * u(2);
        u(4) = dampnings_faktor * u(4);
        u(6) = -dampnings_faktor * u(6);
        bounceCounter = bounceCounter + 1;
    end
    
    if bounceCounter == 6
        stop = i;
        break
    end
end

plot_vec = u_vec(1:stop + 1, :);
plot3(plot_vec(:, 1), plot_vec(:, 3), plot_vec(:, 5), '-');
xlabel('x');
ylabel('y');
zlabel('z');
grid on;
