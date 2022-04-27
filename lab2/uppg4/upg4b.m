

% h = 0.4 : 4.206106345638666e+04
% h/2 : 4.206102487027625e+04
% h/4 : 4.206101522369300e+04


function K = upg4b(h)

f = @(t) (exp(1).^(-1*(t).^2)*calcMax(40 + t))/exp(1).^(-1*(t).^2);
a = -2;
b = 2;

area = 0;
n = (b-a)/h; % antal repetetioner som krävs
reps = 0;

while reps < n

    delArea = ((f(-2 + reps*h) + f(-2 + (reps + 1)*h)) /2) *h;
    area = area + delArea;
    reps = reps + 1;

end

K = area;

end


function res = calcMax(u)
gen = generator(u, 0);
res = max(gen);
end