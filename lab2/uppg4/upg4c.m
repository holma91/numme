
function m = upg4c(h)
    f = @(t) (exp(-t.^2)*genMax(40 + h));
    taljare = (h/3) * (f(-2)+ 4*sum(f(-2+h:2*h:2-h)) + 2*sum(f(-2+2*h:2*h:2-2*h)) + f(2)); %simpson
                              % udda xi-termer          %jämna xi-termer
                              
    m = taljare/upg4a(h); % väntvärdet m
   
end

function res = genMax(u)
    gen = generator(u, 0);
    res = max(gen);
end