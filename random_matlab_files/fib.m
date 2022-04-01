function [f, n] = fib(x)
    n = 0;
    i = 0;
    j = 1;
    while j < x
        n = n + 1;
        tmp = j;
        j = i + j;
        i = tmp;
    end
    
    f = i;

      



