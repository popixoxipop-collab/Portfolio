% 주어진 함수
f = @(x) 1 ./ (1 + 25 * x.^2);

% 등간격으로 0부터 1까지 나눈 다섯 개의 점
x_values_5 = linspace(0, 1, 5);

% 각 점에서의 함수값 계산
y_values_5 = f(x_values_5);

% 3개의 등간격으로 0부터 1까지 나눈 점
x_values_3 = linspace(0, 1, 3);

% 각 점에서의 함수값 계산
y_values_3 = f(x_values_3);

% 결과 출력
fprintf('등간격으로 나눈 다섯 개의 점에서의 함수값:\n');
for i = 1:numel(x_values_5)
    fprintf('x = %.2f, f(x) = %.4f\n', x_values_5(i), y_values_5(i));
end

fprintf('\n등간격으로 나눈 세 개의 점에서의 함수값:\n');
for i = 1:numel(x_values_3)
    fprintf('x = %.2f, f(x) = %.4f\n', x_values_3(i), y_values_3(i));
end