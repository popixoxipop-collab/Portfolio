format long

% 주어진 행렬 A와 벡터 b
A = [90000 300 1; 160000 400 1; 250000 500 1];
b = [0.616 0.525 0.457]';
x = A(:,2);
y = b;
x_val = 450;

% 1차 다항식 보간
p1 = polyfit(x, y, 1);
yp1 = polyval(p1, x_val);
fprintf('1차 다항식 수식: y = %fx + %f\n', p1(1), p1(2));
fprintf('1차 다항식 보간: F(%d) = %f\n\n', x_val, yp1);

% 2차 다항식 보간
p2 = polyfit(x, y, 2);
yp2 = polyval(p2, x_val);
fprintf('2차 다항식 수식: y = %fx^2 + %fx + %f\n', p2(1), p2(2), p2(3));
fprintf('2차 다항식 보간: F(%d) = %f\n\n', x_val, yp2);

% Newton 보간법 구현
n = length(x);
divided_diff = zeros(n, n);
divided_diff(:,1) = y;
for j = 2:n
    for i = 1:n-j+1
        divided_diff(i,j) = (divided_diff(i+1,j-1) - divided_diff(i,j-1)) / (x(i+j-1) - x(i));
    end
end

P_newton = divided_diff(1,1);
term_str = sprintf('%.10f', divided_diff(1,1));
for i = 2:n
    term = divided_diff(1,i);
    term_str = [term_str sprintf(' + %.10f', term)];
    for j = 1:i-1
        term = term * (x_val - x(j));
        term_str = [term_str sprintf('(x - %.1f)', x(j))];
    end
    P_newton = P_newton + term;
end
fprintf('Newton 다항식 수식: %s\n', term_str);
fprintf('Newton 다항식 보간: F(%d) = %f\n\n', x_val, P_newton);

% Lagrange 보간법 구현
L = 0;
lagrange_terms = cell(n, 1);
for i = 1:n
    term = y(i);
    term_str = sprintf('%.10f', y(i));
    for j = 1:n
        if i ~= j
            term = term * (x_val - x(j)) / (x(i) - x(j));
            term_str = [term_str sprintf('(x - %.1f)/%.1f', x(j), (x(i) - x(j)))];
        end
    end
    L = L + term;
    lagrange_terms{i} = term_str;
end
fprintf('Lagrange 다항식 수식: \n');
for i = 1:n
    fprintf('L%d(x) = %s\n', i, lagrange_terms{i});
end
fprintf('Lagrange 다항식 보간: F(%d) = %f\n\n', x_val, L);