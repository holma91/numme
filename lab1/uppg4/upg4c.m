
% h = 0.4 : 1.052497327438429e+04
% h/2 : 1.051765620450827e+04
% h/4 : 1.051556316209440e+04

function m = upg4c(h)
    f = @(t) (exp(-t.^2) * genMax(40 + t));
    a = -2;
    b = 2;
    taljare = (h/3)*(f(-2) + 4*sum(arrayfun(f, (a+h:2*h:b-h))) + 2*sum(arrayfun(f, (a+2*h:2*h:b-2*h))) + f(2)); %simpson
                              % udda xi-termer          %jämna xi-termer
                              
    m = taljare/upg4a(h); % väntvärdet m
   
end

function res = genMax(u)
    gen = generator(u, 0);
    res = max(gen);
end


