calcImpactY(21.5039);


function a = calcImpactY (degree)

v = [0; cosd(degree) * cosd(30) * 25; 0; -(sind(degree) * 25 * cosd(30)); 1.5; sind(30) * 25];

a = @(v) 5 + v(5) *0.25;

c = 0.069;

q = @(v) c*sqrt(v(2).^2 + (v(4) - a(v)).^2 + v(6).^2);

derivata = @(t,v) [v(2); -q(v)*v(2); v(4); -q(v)*(v(4) - a(v)); v(6); -(9.81+(q(v)*v(6)))];

t0 = 0;

h = 0.01;

t = 100;

totalReps = (t - t0)/h;

currentReps = 0;

t = t0;

bounces = 0;

savedResults = zeros(totalReps, 7);

while currentReps < totalReps
    plot3(v(1), v(3), v(5), ".")
    hold on;
    grid on
    xlabel "x", zlabel "z", ylabel "y"
    currentReps = currentReps + 1;
    k1 = derivata(t, v);
    k2 = derivata(t+h/2, v + h/2*k1);
    k3 = derivata(t+h/2, v + h/2*k2);
    k4 = derivata(t + h, v + h*k3);
    v = v + h*(k1 + 2*k2 + 2*k3 + k4)/6;
    savedResults(currentReps, 1:6) = v;
    savedResults(currentReps, 7) = t;
    t = t+h;
    disp(savedResults(currentReps, :));
    disp(savedResults(currentReps, 5));
    
    if v(5) < 0 && savedResults(currentReps-1, 5) > 0
        v(6) = -0.8*v(6);
        v(4) = 0.8*v(4);
        v(2) = 0.8*v(2);
        bounces = bounces +1;
        if bounces == 5
            break
        end
    end

    
end
a = 0;
end