
function I = upg4help
I = abs(upg4b(0.4) - upg4b(0.4/2));
end
% differans mellan t2 och t3: 0.009646583246649
% differans mellan t1 och t2 : 0.038586110407778

%Genom att ta differans mellan t1 och t2 dividerat med differans mellan t2 och t3
% får vi nogrannhetsordningen vilket verkar vara 4. Detta låter rimligt då
% nogrannhetsordningen för just trapetsreglen är 4.