

% h = 0.4 : 1.050350632301338e+04
% h/2 : 1.051194940029147e+04
% h/4 : 1.051411476615779e+04


function M = upg4b(h)

    f = @(t) (exp(-t.^2)*genMax(40 + t));
    a = -2;
    b = 2;

    %Räkna täljaren med trapets
    taljare = h*(f(a)/2 + sum(arrayfun(f, (a+h:h:b-h))) + f(b)/2); 

    % räkna M 
    M = taljare/upg4a(0.0001); 

end


function res = genMax(u)
    gen = generator(u, 0);
    res = max(gen);
end