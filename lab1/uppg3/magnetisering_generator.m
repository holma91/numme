% a) most damaged area around (-0.3, -0.2)
M = 1.05e4;
f = @(x) max(generator(x, 0)) - M;

% initial guesses
x0 = 30;
x1 = 60;
% Använder sekantmetod för att se
% när max värdet för generatorn subtraherat med maximala 
% magnitiseringen tillåten av företaget blir mindre än vår tolerans
theta = secantmethod(f, x0, x1, 0.0001); 
disp(theta);                             
                                          
% för att plotta generatorn i a)
% generator(50, 1)