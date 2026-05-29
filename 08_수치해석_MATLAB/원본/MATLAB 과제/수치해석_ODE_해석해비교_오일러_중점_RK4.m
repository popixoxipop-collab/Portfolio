% 초기 조건 및 매개 변수 설정
y0 = 2;
h = 0.5;
t_values = 0:h:1;
num_steps = length(t_values);

% 주어진 함수 정의
f = @(t, y) 4 * exp(0.8 * t) - 0.5 * y;

% 해석적 해
C = y0 - (4/1.3); % y(0) = 0을 이용해 C를 계산
analytical_solution = @(t) (4/1.3) * exp(0.8 * t) + C * exp(-0.5 * t);

% Euler법
y_euler = zeros(1, num_steps);
y_euler(1) = y0;
for i = 2:num_steps
    y_euler(i) = y_euler(i-1) + h * f(t_values(i-1), y_euler(i-1));
end

% 중점법
y_midpoint = zeros(1, num_steps);
y_midpoint(1) = y0;
for i = 2:num_steps
    k1 = f(t_values(i-1), y_midpoint(i-1));
    k2 = f(t_values(i-1) + h/2, y_midpoint(i-1) + h/2 * k1);
    y_midpoint(i) = y_midpoint(i-1) + h * k2;
end

% 4차 Runge-Kutta법
y_rk4 = zeros(1, num_steps);
y_rk4(1) = y0;
for i = 2:num_steps
    k1 = h * f(t_values(i-1), y_rk4(i-1));
    k2 = h * f(t_values(i-1) + h/2, y_rk4(i-1) + k1/2);
    k3 = h * f(t_values(i-1) + h/2, y_rk4(i-1) + k2/2);
    k4 = h * f(t_values(i-1) + h, y_rk4(i-1) + k3);
    y_rk4(i) = y_rk4(i-1) + (1/6) * (k1 + 2*k2 + 2*k3 + k4);
end

% 해석적 해를 위한 t값
t_cont = linspace(0, 1, 100);
y_cont = analytical_solution(t_cont);

% 그래프 그리기
figure;
hold on;
plot(t_cont, y_cont, 'k-', 'LineWidth', 1.5);
plot(t_values, y_euler, 'bo-', 'LineWidth', 1.5);
plot(t_values, y_midpoint, 'go-', 'LineWidth', 1.5);
plot(t_values, y_rk4, 'ro-', 'LineWidth', 1.5);
xlabel('t');
ylabel('y(t)');
legend('Analytical Solution', 'Euler Method', 'Midpoint Method', 'Runge-Kutta 4th Order', 'Location', 'Best');
title('Comparison of Numerical Methods');
grid on;
hold off;