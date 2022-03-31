function [] = fixpointconvergence(xs)

g = @(x) 1/4 * (x.^2 - 2*sin(3*x + 1) - 2)+ x;
dg = @(x) -((3*cos(3*x + 1) - x - 2)/2);

%nollpunkterna som kan framställas genom fixpunktmetoden är -1.9852 and -0.63984

% Sats: (1.6 i Sauer) Antag att g  ̈ar kontinuerligt differentierbar,
% att x ∗ = g (x ∗) och att |g ′(x ∗)| = S < 1. F ̈or startgissningar
% tillr ̈ackligt n ̈ara x ∗ konvergerar d ̊a fixpunktsiterationen linj ̈art mot
% fixpunkten x ∗.

if(dg(xs) < 1)
    fprintf("xs = " + xs)
    fprintf("\n" + "g(xs) = " + g(xs))
    fprintf("\n" + "g'(xs) = " + dg(xs))
    
    disp("Den konvergerar och är linjär")
else
    disp("Konvergerar inte")

end

