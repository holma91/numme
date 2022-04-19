load eiffel4.mat
N = size(A, 1);
b = randn(N ,1);

tic;
i = 0;
while i < 10
    i = i + 1;
    x = A\b;
end
toc

tic;
i = 0;
while i < 10
    i = i + 1;
    x2 = inv(A)*b;
end
toc