% Define parameters
g = 9.81;  % acceleration due to gravity (m/s^2)
L = 70;    % characteristic length (m)
C_d = 0.275;  % drag coefficient

% Calculate the constant factor
constant_factor = sqrt(g * L / C_d);

% Define the time range and number of points
t = linspace(0, 8, 7);

% Calculate the velocity values
v = round(constant_factor * tanh(constant_factor * t));

% Plot the values
figure;
plot(t, v, 'o-', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Velocity vs Time');
grid on;

% Display the value of each point
for i = 1:length(t)
    text(t(i), v(i), sprintf('(%0.1f, %d)', t(i), v(i)), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
end