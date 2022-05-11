% Kvar att göra: Visa noggrannhetsordning för rk4

v = [0; cosd(30) * 25; 0; 0; 3/2; sind(30) * 25];

a = @(v) 5 + v(5) *0.25;

c = 0.069;

q = @(v) c*sqrt(v(2).^2 + (v(4) - a(v)).^2 + v(6).^2);

derivata = @(v) [
    v(2); 
    -q(v)*v(2); 
    v(4); 
    -q(v)*(v(4) - a(v)); 
    v(6); 
    -(9.81+(q(v)*v(6)))];

t0 = 0;
h = 0.002;
t = 4;

totalReps = (t - t0)/h;

currentReps = 0;

t = t0;

% c = 5;

savedResults = zeros(totalReps, 7);

while currentReps < totalReps
    currentReps = currentReps + 1;
    k1 = derivata(v);
    k2 = derivata(v + h/2*k1);
    k3 = derivata(v + h/2*k2);
    k4 = derivata(v + h*k3);

    v = v + h*(k1 + 2*k2 + 2*k3 + k4)/6;
%     savedResults(currentReps, 1:6) = v;

    plot3(v(1), v(3), v(5), ".")
    hold on;
    grid on
    xlabel "x", zlabel "z", ylabel "y"
    
    disp([v(1), v(3), v(5)])
    if v(5) < 0
        break
    end
end