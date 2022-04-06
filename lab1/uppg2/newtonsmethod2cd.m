

% Valid x0 guesses based on the graph from 2a): 1.2 and -2.5 
% for the largest and smallest zero value

function [] = newtonsmethod2cd(x0)
f = @(x) x.^2 - 2*sin(3*x + 1) - 2;
df = @(x) 2*x - 6*cos(3*x + 1);
tol = 1e-8;
itercount = 0;
    % newton method with a tolerance check
    x = x0;
    y = f(x);
    
    while abs(y) > tol
        xs = x; %spara x värde
        h = y/df(x);
        x = x - h ;
        K = abs(x - xs); % diff mellan ny och gammal x
        fprintf("\n iter " + itercount + " : " + K)
        y = f(x);
        itercount = itercount + 1;
        
    end
    % d) Konvergens:
    % Vi ser att antalet ledande nollor ungefär dubbleras för K med varje
    % iteration därför är konvergensen kvadratisk


    fprintf("\n" + "Iteration count: " + itercount);
    fprintf("\n" + "Zero point: " + x);

end