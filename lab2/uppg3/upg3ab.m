% a) Integralens värde beräknat analytiskt är ungefär 3.447715250169207
% (16-4*sqrt(2))/3

% a = -1, b = 1

% Trapetsreglen
function Z = upg3ab(a,b,h)
f = @(x)(x+3).^0.5;
x = a:h:b;
y = f(x);
Z = h*(sum(y)-y(1)/2-y(end)/2); %subtraherar bort hälften av f(start) och f(end) 
                                % eftersom vi summerar allt
end


% b)     
% h = 1 : 3.4392
% h = 0.5 : 3.4456
% h = 0.25 : 3.4472
% h = 025 : 3.4476.1
% h = 0.0625 : 3.4477
% Ja, approximationen verkar konvergera då h går mot 0




