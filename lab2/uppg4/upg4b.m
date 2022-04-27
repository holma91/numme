

% h = 0.4 : 1.050350632301338e+04
% h/2 : 1.051194940029147e+04
% h/4 : 1.051411476615779e+04


function M = upg4b(h)

f = @(t) (exp(-t.^2)*genMax(40 + t));
a = -2;
b = 2;

taljare = 0;
n = (b-a)/h; % antal repetetioner som krävs
reps = 0;

while reps < n

    delTaljare = ((f(-2 + reps*h) + f(-2 + (reps + 1)*h)) /2) *h;
    taljare = taljare + delTaljare;
    reps = reps + 1;

end
M = taljare/upg4a(0.0001);

end


function res = genMax(u)
gen = generator(u, 0);
res = max(gen);
end