
h = [1, 0.5, 0.25, 0.125, 0.0625];

T0 = 0;
Z0 = 0; %För noggrannhetsordningarna


for i = 1 : 5
    I = (16-4*sqrt(2))/3;
    
    T = abs(upg3ab(-1,1,h(i)) - I); % T(h)
    
    % För att se noggrannhetsordningen för trapetsreglen
    %K = T0 / T
    %T0 = T;

    % upg 3d) Richardson-extrapolation
    R = (2.^2*upg3ab(-1,1,h(i)/2) - upg3ab(-1,1,h(i))) / (2.^2 - 1); % R(h)

    Z = abs(R - I);
    
    % För att se noggrannhetsordningen för trapetsreglen med Richardson-extrapolation
    %K = Z0 / Z
    %Z0 = Z;
  
    loglog(h(i), T,'*');
    hold on
    loglog(h(i), Z, 'o');
    hold on
    grid on
   
end

%c)

% h           - 1       - 0.5    - 0.25      - 0.125       - 0.0625
% T(h)         - 3.4392 - 3.4456 - 3.4472    - 3.4476      - 3.4477
% |(T(h) - I)| - 0.0085 - 0.0022 - 5.390e-04 - 1.348e-04 - 3.370e-05

% d)

% h           - 1       - 0.5    - 0.25      - 0.125       - 0.0625
% R(h)         - 3.44769 - 3.4477 - 3.4477    - 3.4477      - 3.4477
% |(R(h) - I)| - 1.77e-05 - 1.16e-06 - 7.37e-08 - 4.62e-09 - 2.89e-10


% Noggrannhetsordningen för en numerisk metod som använder sig av
% steglängden h. Enligt teorin ska förhållandet mellan en approximativ
% lösning med steglängd h och en med steglängd h/2 vara ungefär 2^p. Där p
% är noggrannhetsordning vilket är 2 för trapetsreglen. Därför ska felet ha
% en faktor om 4 vid varje halvering på h.

% Så faktorn som vi förväntar oss är ungefär 2^2 vilket är 4. Och som vi ser verkar
% detta ungefär stämma överens med vårt svar. (Vi får detta värde om vi
% delar Q0 med Q vilket är kommenterat ut i koden ovan).

% För Richardson extrapolationen så ska nogrannhetsordningen öka med minst
% p + 1 vilket i detta fall ska vara 3. Men genom att titta på grafen och
% använda den kommenterade koden ovan för "K" ser vi att faktorn är cirka
% 16 vilket motsvarar en nogrannhetsordning på 4 då 2^4 är 16.





