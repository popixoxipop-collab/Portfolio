% 주어진 함수
f = @(x) 1 ./ (1 + 25 * x.^2);

% 등간격으로 5개의 점 생성
x_points_5 = linspace(0, 1, 5);
y_points_5 = f(x_points_5);

% Cubic 스플라인 보간
pp_5 = spline(x_points_5, [0, y_points_5, 0]);

% 등간격으로 3개의 점 생성
x_points_3 = linspace(0, 1, 3);
y_points_3 = ppval(pp_5, x_points_3);

% Cubic 스플라인 보간 (3개의 점)
pp_3 = spline(x_points_3, [0, y_points_3, 0]);

% 시각화
xx = linspace(0, 1, 1000);
yy = f(xx);

figure;
plot(xx, yy, 'b-', 'LineWidth', 2); hold on;
plot(x_points_5, y_points_5, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 10);
plot(xx, ppval(pp_5, xx), 'r--', 'LineWidth', 1.5);
plot(x_points_3, y_points_3, 'go', 'MarkerFaceColor', 'g', 'MarkerSize', 10);
plot(xx, ppval(pp_3, xx), 'g--', 'LineWidth', 1.5);
xlabel('x');
ylabel('f(x)');
title('Cubic 스플라인 보간');
legend('원본 함수', '등간격 5개의 점', '등간격 5개의 점 스플라인', '등간격 3개의 점', '등간격 3개의 점 스플라인');
grid on;