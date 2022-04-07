% Valid x0 guesses based on the graph from 2a): 1.2 and -2.5 
% for the largest and smallest zero value

function [] = newtonsmethod2c(x0)
    f = @(x) x.^2 - 2*sin(3*x + 1) - 2;
    df = @(x) 2*x - 6*cos(3*x + 1);
    tol = 1e-8;
    itercount = 0;
        % newton method with a tolerance check
        x = x0;
        y = f(x);
        
        while abs(y) > tol
            xs = x;
            h = y/df(x);
            x = x - h ;
            K = abs(x - xs);
            fprintf("\n iter " + itercount + " : " + K)
            y = f(x);
            itercount = itercount + 1;
            
        end
      
        % Vi ser att antalet ledande nollor ungefär dubbleras med varje
        % iteration vilket visar att konvergensen kvadratisk
    
        fprintf("\n" + "Iteration count: " + itercount);
        fprintf("\n" + "root: " + x);
        fprintf("\n");