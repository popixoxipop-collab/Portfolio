x = [0.1 0.2 0.4 0.6 0.9 1.3 1.5 1.7 1.8];
y = [0.75 1.25 1.45 1.25 0.85 0.55 0.35 0.28 0.18];

% 1차 및 3차 다항 회귀 수행
a1 = polyfit(x, y, 1);
a3 = polyfit(x, y, 3);

% 1차 회귀 결과 계산
xp = linspace(min(x), max(x), 50);
yp1 = polyval(a1, xp);

% 3차 회귀 결과 계산
yp3 = polyval(a3, xp);

% 비선형 회귀 수행
Y = log(y ./ x);
objectiveFunction = @(p) sum((Y - (p(1) + p(2) * x)).^2);
fssr = fminsearch(objectiveFunction, [0, 0]);
ln_a = fssr(1);
b = fssr(2);
a = exp(ln_a);
yp_fit = a .* xp .* exp(b * xp);

% 결과 출력
fprintf('1st order에서 a1 %f , a0 %f\n\n', a1(1), a1(2));
fprintf('3rd order에서 b3 %f , b2 %f , b1 %f , b0 %f\n\n', a3(1), a3(2), a3(3), a3(4));
fprintf('비선형 회귀 결과: a = %f, b = %f\n\n', a, b);

% Sr, r2, Syx 계산
% 1차 다항 회귀
y1_fit = polyval(a1, x);
Sr1 = sum((y - y1_fit).^2);
r2_1 = 1 - Sr1 / sum((y - mean(y)).^2);
Syx1 = sqrt(Sr1 / (length(y) - length(a1)));

% 3차 다항 회귀
y3_fit = polyval(a3, x);
Sr3 = sum((y - y3_fit).^2);
r2_3 = 1 - Sr3 / sum((y - mean(y)).^2);
Syx3 = sqrt(Sr3 / (length(y) - length(a3)));

% 비선형 회귀
y_fit = a .* x .* exp(b * x);
Sr_nl = sum((y - y_fit).^2);
r2_nl = 1 - Sr_nl / sum((y - mean(y)).^2);
Syx_nl = sqrt(Sr_nl / (length(y) - 2)); % 비선형 회귀에서는 파라미터가 2개

% 결과 출력
fprintf('1st order 회귀: Sr = %f, r^2 = %f, Syx = %f\n\n', Sr1, r2_1, Syx1);
fprintf('3rd order 회귀: Sr = %f, r^2 = %f, Syx = %f\n\n', Sr3, r2_3, Syx3);
fprintf('비선형 회귀: Sr = %f, r^2 = %f, Syx = %f\n\n', Sr_nl, r2_nl, Syx_nl);

% 그래프 시각화
figure;
plot(x, y, 'o', 'MarkerEdgeColor', 'k'); 
hold on; 
plot(xp, yp1, 'b'); 
plot(xp, yp3, 'r'); 
plot(xp, yp_fit, 'g');
grid on; 
xlabel('x');
ylabel('y');
legend('Data points', '1st order fit', '3rd order fit', 'y = a \cdot x \cdot e^{bx}');
hold off;