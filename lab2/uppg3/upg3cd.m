grid on
h = [1, 0.5, 0.25, 0.125, 0.0625];
for i = 1 : 5
    I = 3.4477;
    
    Q = abs(upg3ab(-1,1,h(i)) - I);
    loglog(h(i), Q,'*');
    hold on

    % upg 3d) Richardson-extrapolation
    R = (2.^2*upg3ab(-1,1,h(i)/2) - upg3ab(-1,1,h(i))) / (2.^2 - 1);

    Z = abs(R - I);
    loglog(h(i), Z, 'o');
    hold on

    
   
end

%c)

% h           - 1       - 0.5    - 0.25      - 0.125       - 0.0625
% T(h)         - 3.4392 - 3.4456 - 3.4472    - 3.4476      - 3.4477
% |(T(h) - I)| - 0.0085 - 0.0021 - 5.2380e-04 - 1.1957e-04 - 1.8457e-05


% Noggrannhetsordningen för en numerisk metod som använder sig av
% steglängden h. Enligt teorin ska förhållandet mellan en approximativ
% lösning med steglängd h och en med steglängd h/2 vara ungefär 2^p. Där p
% är noggrannhetsordning vilket är 2 för trapetsreglen. 

% Så faktorn som vi förväntar oss är ungefär 2^2 vilket är 4. Och som vi ser verkar
% detta ungefär stämma överens med vårt svar. 

% 0.0085 / 0.0021 = 4.05
% 0.0021 / 5.2380e-04 = 4
% 5.2380e-04 / 1.1957e-04 = 4.38
% 1.1957e-04 / 1.8457e-05 = 6.48

% d)

% h           - 1       - 0.5    - 0.25      - 0.125       - 0.0625
% R(h)         - 3.4392 - 3.4456 - 3.4472    - 3.4476      - 3.4477
% |(R(h) - I)| - 0.0085 - 0.0021 - 5.2380e-04 - 1.1957e-04 - 1.8457e-05
