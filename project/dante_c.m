x0 = 0;
x1 = 90;
diffx = inf;
tol = 1e-10;
iterationer = 0;

while abs(diffx) > tol
    x0Copy = x0;
    x0 = x1;
    x1 = x1 - ((calcImpactY(x1) * (x1 - x0Copy))/(calcImpactY(x1) - calcImpactY(x0Copy))); 
    diffx = x1-x0; 
    iterationer = iterationer + 1; 
    disp([iterationer x1 x0 diffx]) 
end

function result = calcImpactY (degree)

    v = [0; cosd(degree) * cosd(30) * 25; 0; -(sind(degree) * 25 * cosd(30)); 1.5; sind(30) * 25];
    
    a = @(v) 5.25 + v(5) *0.25; % 5 +- 0.25
    
    c = 0.069;
    
    q = @(v) c*sqrt(v(2).^2 + (v(4) - a(v)).^2 + v(6).^2);
    
    derivata = @(t,v) [
        v(2); 
        -q(v)*v(2); 
        v(4); 
        -q(v)*(v(4) - a(v)); 
        v(6); 
        -(9.81+(q(v)*v(6)))
    ];
    
    t0 = 0;
    
    h = 0.01;
    
    t = 4;
    
    totalReps = (t - t0)/h;
    
    currentReps = 0;
    
    t = t0;
    
    savedResults = zeros(totalReps, 7);
    
    while currentReps < totalReps
        currentReps = currentReps + 1;
        k1 = derivata(t, v);
        k2 = derivata(t+h/2, v + h/2*k1);
        k3 = derivata(t+h/2, v + h/2*k2);
        k4 = derivata(t + h, v + h*k3);
        v = v + h*(k1 + 2*k2 + 2*k3 + k4)/6;
        savedResults(currentReps, 1:6) = v;
        savedResults(currentReps, 7) = t;
        t = t+h;
    
        plot3(v(1), v(3), v(5), ".")
        hold on;
        grid on
        xlabel "x", zlabel "z", ylabel "y"
        
    
        
        if v(5) == 0
            x_kordinat = v(1);
            y_kordinat = v(3);
            z_kordinat = v(5);
        end
        
        if v(5) < 0 
            x_kordinat_a = savedResults(currentReps - 1, 1);
            x_kordinat_b = savedResults(currentReps, 1);
            y_kordinat_a = savedResults(currentReps - 1, 3);
            y_kordinat_b = savedResults(currentReps, 3);
            z_kordinat_a = savedResults(currentReps - 1, 5);
            z_kordinat_b = savedResults(currentReps, 5);
    
            z_kordinat = 0;          
            x_kordinat = x_kordinat_b + (x_kordinat_a - x_kordinat_b)*(z_kordinat - z_kordinat_b)/(z_kordinat_a - z_kordinat_b);
            y_kordinat = y_kordinat_b + (y_kordinat_a - y_kordinat_b)*(z_kordinat - z_kordinat_b)/(z_kordinat_a - z_kordinat_b);
        end
        
        %disp([v(1), v(3), v(5), t])
        if v(5) < 0
            break
        end
        
    end
    
    result = y_kordinat;
end