fprintf( "   G-S 반복법으로 A,b에 대한 해 계산 \n")
format short
A = [10 2 -1; -3 -6 2; 1 1 5];
b = [27; -61.5; -21.5];
es = 0.0001;
maxit = 50;

C = A;
[m, n] = size(A);
x = zeros(n, 1); 
ea = zeros(n, 1); 
d = zeros(n, 1); 

for i = 1:n
    C(i, i) = 0;
end

for i = 1:n
    C(i, 1:n) = C(i, 1:n) / A(i, i);
end

for i = 1:n
    d(i) = b(i) / A(i, i);
end

iter = 0;

while (1)
    xold = x;
    for i = 1:n
        x(i) = d(i) - C(i, :) * x;
        if x(i) ~= 0
            ea(i) = abs((x(i) - xold(i)) / x(i)) * 100;
        end
    end
    
    iter = iter + 1;
    fprintf( "\n   iter %d  x  %.4f   %.4f   %.4f   ea  %.4f%%   %.4f%%   %.4f%%   \n", iter, x,ea)
    if max(ea) <= es || iter >= maxit
        break
    end
end

x 
 
fprintf("  Jacobi 반복법으로 A,b에 대한 해 계산 \n")

A = [10 2 -1; -3 -6 2; 1 1 5];
b = [27; -61.5; -21.5];
es = 0.0001;
maxit = 50;

[m, n] = size(A);
x = zeros(n, 1); 
xold = zeros(n, 1);
ea = zeros(n, 1); 
d = zeros(n, 1); 

for i = 1:n
    d(i) = b(i) / A(i, i);
    x(i) = d(i); 
end

iter = 0;

while (1)
    xold = x; 
    for i = 1:n
        sum = 0;
        for j = 1:n
            if j ~= i
                sum = sum + A(i, j) * xold(j);
            end
        end
        x(i) = (b(i) - sum) / A(i, i);
        ea(i) = abs((x(i) - xold(i)) / x(i)) * 100;
    end
    
    iter = iter + 1;
    fprintf("\n   iter %d  x  %.4f   %.4f   %.4f   ea  %.4f%%   %.4f%%   %.4f%%   \n", iter, x,ea) 
    if max(ea) <= es || iter >= maxit
        break
    end
end
x
