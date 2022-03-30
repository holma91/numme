
function [] = fixedpointmathod2b(g, x0)
tol = 1e-8;
itercount = 0;
%g = @(x) 1/4 * (x.^2 - 2*sin(3*x + 1) - 2)+ x;

%Only the zeropoints -1.9852 and -0.63984 can be found with the fixed point
%method. 

%Valid values for x0 to find each zeropoint: "0" for -0.63984 and -1.5 for -1.9852 




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

fprintf("\n" + "Amount of iterations: " + num2str(itercount))

end



