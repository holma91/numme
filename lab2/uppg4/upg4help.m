
function I = upg4help

I = abs(upg4c(0.000001) - upg4c(0.00001));
end

%b)

% test1: h = 0.4 : 1.050350632301338e+04
% test2: h/2 : 1.051194940029147e+04
% test3: h/4 : 1.051411476615779e+04

% differans mellan test2 och test3: 2.165365866319917
% differans mellan test1 och test2 : 8.443077278083365

% Genom att ta differans mellan test1 och test2 dividerat med differans mellan test2 och test3
% får vi 2^nogrannhetsordningen eftersom E h / (E h/2) = 2^p vilket verkar vara 2 eftersom kovet är cirka 4. 
% Detta låter rimligt då nogrannhetsordningen för just trapetsreglen är 2.

%c)
 
% differans mellan då h = 0.1 och h = 0.2 = 2.093042413869625
% vilket är ett fel som är mindre än i b). Detta beror på att noggrannhetsordningen i täljaren
% för simpson är 4 medan trapetsregeln är 2. Det är bättre att använda
% simpson eftersom den konvergerar snabbare vid små h vid halvering på h.

