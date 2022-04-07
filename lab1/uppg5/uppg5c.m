load eiffel4.mat
N = size(A, 1);
b = randn(N ,1); % Godtyckligt b

tic;
i = i + 1;
x = A\b;
toc

tic;
i = i + 1;
x2 = inv(A)*b;
toc

%{
file - N - A\b - inv(A)*b
eiffel1.mat - 522 - 0.061100s - 0.112502s
eiffel2.mat - 798 - 0.042623s - 0.053917s
eiffel3.mat - 1122 - 0.057756s - 0.115175s
eiffel4.mat - 3184 - 0.349001s - 0.794976s

gausselimination ar O(n^3)
eiffel1 ger 522^3, eiffel2 ger 798^3
mellan eiffel1 och eiffel2 ökar n med en faktor 798/522
ökningen mellan 1 och 2 ska alltså teoretiskt vara N1^3/N2^3
som i fallet mellan 1 och 2 är 798^3/522^3

om vi bara iterarar en gång kan man inte få något bra resultat
eftersom att "provstorleken" är för liten. Om vi ökar "provstorleken"
så närmar sig de experimentella resultat de teoretiska.
vi testar detta i filen uppg5cImproved.m med while loops med 
10 iterationer per typ av operation.
%}
