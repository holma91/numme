
function [] = fixedpointmethod2b(x0)
tol = 1e-8;
itercount = 0;
g = @(x) 1/4 * (x.^2 - 2*sin(3*x + 1) - 2)+ x;

%{
Only the roots -1.9852 and -0.63984 can be found with the fixed point
method. We can't find the roots -1.352 and 0.919.
Valid values for x0 to find each root: "0" for -0.63984 and "-1.5" for -1.9852 
Anledning till varför endast två punkter kan hittas finns i filen
fixpointconvergence.m
%}


while itercount < 200
    x = g(x0);
    if abs(x - x0) < tol
        fprintf("\n" + "Zero point: " + num2str(x))
       
        break;
    else
        x0 = x;
        itercount = itercount + 1;
        
    end
end

fprintf("\n" + "number of iterations: " + num2str(itercount) + '\n')






