
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
 
% differans mellan då h = 0.000001 och h = 0.00001 = 1.549204698676476e-04
% vilket är ett fel som är betydligt mindre än i b) och trots gick metoden snabbare att genomföra. 
% Simpsons metod har också en noggrannhetsordning på 4 vilket innebär att
% en halvering för h ska göra att felet i approximationen för täljaren blir
% 1/16 så stor.
