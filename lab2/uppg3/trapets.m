f = @(x) (1-x).*exp(x);

%% del 1
h = 1/4;
T = (0.5*f(0) + f(h) + f(2*h) + f(3*h) + 0.5*f(1))*h
I = -2 + exp(1);
fel = abs(T - I)

%% del 2
h = 1/4;
N = 5;
T_vek = zeros(N, 1);


for i = 1:N
    
    x = 0:h:1;
    %T_vek(i) = h*(sum(f(x)) - 0.5*f(0) - 0.5*f(1));
    T_vek(i) = h*(0.5*f(0) + sum(f(x(2:end-1))) + 0.5*f(1))
    h = h/2;
    
end

T_vek

diff = abs(T_vek(2:end) - T_vek(1:end-1)); % diff innehåller |T_h - T_h/2|, |T_h/2 - T_h/4|
diff(1)/diff(2)
diff(2)/diff(3)

diff(1:end-1)./diff(2:end)

