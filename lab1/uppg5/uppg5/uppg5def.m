
% file        - naiv       - lu          - gles (ej lu) - gles+lu
% eiffel1.mat - 1.815970s  -  0.533932s  - 0.271383s    - 0.065146s
% eiffel2.mat - 6.823214s  -  1.015807s  - 0.740172s    - 0.089096s
% eiffel3.mat - 14.306010s -  2.866646s  - 1.157011s    - 0.123045s
% eiffel4.mat - ...        -  47.129019s - 9.860736s    - 1.692025s

% varfor gar det snabbare att losa med lu?
% - https://stackoverflow.com/questions/34951048/gauss-jordan-elimination-versus-lu-decomposition
% vilken metod loser problemet snabbast?
% - Gles och loser LU problemet snabbast
% 
% for vilken modell blir tidsvinsten storst?
% - rent tidsmassigt: modell 4 eftersom att den ar storst.
%   om nagot tar 100s och du fixar en 2x improvement - du har tjanat 50s
%   om nagot tar 1s och du fixar en 2x improvement - du har tjanat 0.5s
