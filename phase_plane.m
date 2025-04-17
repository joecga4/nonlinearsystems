close all
clear all
clc
% Define the system of equations
function dx = system(t, x)
    dx = zeros(2,1);
    dx(1) = -x(1) + x(1)*x(2);
    dx(2) = -x(2);
end
% Create a grid of points for the phase plane
x1_vals = linspace(-20, 20, 50);
x2_vals = linspace(-20, 20, 50);
[X1, X2] = meshgrid(x1_vals, x2_vals);
% Calculate the derivatives at each point in the grid
dX1 = -X1 + X1.*X2;
dX2 = -X2;
% Normalize the vectors for better visualization
magnitude = sqrt(dX1.^2 + dX2.^2);
dX1 = dX1 ./ magnitude;
dX2 = dX2 ./ magnitude;
% Plot the phase plane
figure('Position', [100, 100, 800, 800]);
quiver(X1, X2, dX1, dX2, 'b', 'LineWidth', 0.5);
title('Phase Plane', 'FontSize', 12);
xlabel('$x_1$', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('$x_2$', 'Interpreter', 'latex', 'FontSize', 12);
grid on
% Simulate trajectories with initial conditions
initial_conditions = [-1.5, 1.5; 0.5, -1.0; 1.0, 0.5; -0.5, -0.5];
t = linspace(0, 10, 500);
for i = 1:size(initial_conditions, 1)
    x0 = initial_conditions(i, :);
    [t, trajectory] = ode45(@system, t, x0);
    plot(trajectory(:, 1), trajectory(:, 2), 'LineWidth', 2);
    hold on;
end
legend(arrayfun(@(i) sprintf('IC: (%.1f, %.1f)', initial_conditions(i, 1), initial_conditions(i, 2)), 1:size(initial_conditions,1), 'UniformOutput', false));
grid on;
grid minor;
% MATLAB code to generate a phase plane plot and simulate trajectories
% using the ode45 solver for a system of differential equations.

