
% Define the differential equation as a function
f = @(t, y) y*t^2 - 1.1*y;

% Initial conditions
t0 = 0;
y0 = 1;
h = 0.5;
tf = 1;
t_values = t0:h:tf;

% Preallocate arrays for each method
y_euler = zeros(size(t_values));
y_midpoint = zeros(size(t_values));
y_rk4 = zeros(size(t_values));

% Initial values
y_euler(1) = y0;
y_midpoint(1) = y0;
y_rk4(1) = y0;

% Euler's method
for i = 1:length(t_values)-1
    y_euler(i+1) = y_euler(i) + h * f(t_values(i), y_euler(i));
end

% Midpoint method
for i = 1:length(t_values)-1
    k1 = f(t_values(i), y_midpoint(i));
    k2 = f(t_values(i) + h/2, y_midpoint(i) + h/2 * k1);
    y_midpoint(i+1) = y_midpoint(i) + h * k2;
end

% 4th order Runge-Kutta method
for i = 1:length(t_values)-1
    k1 = f(t_values(i), y_rk4(i));
    k2 = f(t_values(i) + h/2, y_rk4(i) + h/2 * k1);
    k3 = f(t_values(i) + h/2, y_rk4(i) + h/2 * k2);
    k4 = f(t_values(i) + h, y_rk4(i) + h * k3);
    y_rk4(i+1) = y_rk4(i) + h/6 * (k1 + 2*k2 + 2*k3 + k4);
end

% Plot the results
figure;
plot(t_values, y_euler, 'o-', 'DisplayName', 'Euler Method');
hold on;
plot(t_values, y_midpoint, 'x-', 'DisplayName', 'Midpoint Method');
plot(t_values, y_rk4, 's-', 'DisplayName', '4th Order Runge-Kutta Method');
hold off;

xlabel('t');
ylabel('y');
title('Comparison of Numerical Methods for Solving ODE');
legend('Location', 'best');
grid on;