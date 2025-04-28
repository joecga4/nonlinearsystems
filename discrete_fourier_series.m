close all; clc; clear;

% Discrete Fourier Series
N = 6; % period of the signal
n = 0:N-1; % time index
x = (1+cos(2*pi/6*n)).*sin(2*pi/6*n+pi/4); % input signal in one period
wo = 2*pi/N; % fundamental frequency
[a_k, a_k2] = discrete_fourier_series_coefficients(x, N); % compute the coefficients
disp(a_k); % display the coefficients
disp(a_k2); % display the alternative coefficients

x_n = zeros(1, N); % initialize the Fourier series signal
for n = 1:N
    x_n(n) = sum(a_k .* exp(1j*(0:(N-1))*wo*(n-1))); % compute the Fourier series signal
end

% Plot the results
figure;
subplot(2, 1, 1);
stem(0:(N-1), x, "filled"); % plot the input signal
title('Input Signal');
xlabel('n'); ylabel('x[n]');
grid; grid minor;
axis([0 N -1 2]);

subplot(2, 1, 2);
stem(0:(N-1), real(x_n), "filled"); % plot the Fourier series signal
title('Fourier Series Representation');
xlabel('n'); ylabel('x[n]');
grid; grid minor;
axis([0 N -1 2]);