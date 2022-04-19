% file        - naiv       - lu          - gles (ej lu) - gles+lu
% eiffel1.mat - 1.815970s  -  0.533932s  - 0.271383s    - 0.065146s
% eiffel2.mat - 6.823214s  -  1.015807s  - 0.740172s    - 0.089096s
% eiffel3.mat - 14.306010s -  2.866646s  - 1.157011s    - 0.123045s
% eiffel4.mat - ...        -  47.129019s - 9.860736s    - 1.692025s


% varfor går det snabbare att lösa med lu?
% pga återanvändning. Man beräknar bara LU dekomposering en gång och
% använder det sedan för varje b. Med Gauss måste man göra om arbetet för
% varje b.
% vilken metod löser problemet snabbast?
% - Gles+LU löser problemet snabbast
% 
% for vilken modell blir tidsvinsten störst?
% - rent tidsmässigt: modell 4 eftersom att den är störst.
%   om något tar 100s och du fixar en 2x improvement - du har tjänat 50s
%   om något tar 1s och du fixar en 2x improvement - du har tjänat 0.5s
