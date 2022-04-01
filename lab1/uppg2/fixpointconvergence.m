function [] = fixpointconvergence(xs)

g = @(x) 1/4 * (x.^2 - 2*sin(3*x + 1) - 2)+ x;
dg = @(x) -((3*cos(3*x + 1) - x - 2)/2);

%nollpunkterna som kan framställas genom fixpunktmetoden är -1.9852 and -0.63984

% Fixpunktsiterationen har konvergensordning 1 dvs linjär konvergens
% med konvergenshastighet S = |g ′(x ∗)| om 0 < S < 1

% Svar: den är linjär och konvergerar för startpunkterna som uppfyller
% kravet nedan

if(abs(dg(xs)) < 1)
    fprintf("xs = " + xs)
    fprintf("\n" + "g(xs) = " + g(xs))
    fprintf("\n" + "g'(xs) = " + dg(xs))
    
    disp("Den konvergerar och är linjär")
else
    disp("Konvergerar inte")

end

