% Define the function to be integrated
f = @(x) sin(x); % Example function
a = 0; % Start of interval
b = pi; % End of interval
n = 4; % Number of subintervals

% Generate x values
x = linspace(a, b, 1000);
y = f(x);

% Define points for the methods
h = (b - a) / n;
x_points = a:h:b;
y_points = f(x_points);

% Plot the original function
figure;
plot(x, y, 'b', 'LineWidth', 1.5);
hold on;

% Plot Trapezoidal Rule
for i = 1:n
    fill([x_points(i) x_points(i) x_points(i+1) x_points(i+1)], ...
         [0 y_points(i) y_points(i+1) 0], 'g', 'FaceAlpha', 0.3, 'EdgeColor', 'g');
end

% Plot Simpson's 1/3 Rule
x_simpson13 = [a:h/2:b];
y_simpson13 = f(x_simpson13);
plot(x_simpson13, y_simpson13, 'ro-', 'MarkerFaceColor', 'r');

% Plot Simpson's 3/8 Rule
x_simpson38 = [a:h/3:b];
y_simpson38 = f(x_simpson38);
plot(x_simpson38, y_simpson38, 'mo-', 'MarkerFaceColor', 'm');

% Add legend and labels
legend('Original Function', 'Trapezoidal Rule', 'Simpson 1/3 Rule', 'Simpson 3/8 Rule');
xlabel('x');
ylabel('f(x)');
title('Comparison of Numerical Integration Methods');
grid on;
hold off;