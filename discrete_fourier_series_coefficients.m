% Discrete Fourier Series
% This code computes the Discrete Fourier Series (DFS) coefficients for a given periodic signal.

function [a_k, a_k2] = discrete_fourier_series_coefficients(x, N)
    % Inputs:
    % x - input signal in one period (vector of length N)
    % T - period of the signal (scalar)
    % N - number of harmonics (scalar)

    % Outputs:
    % an - exponential coefficients (vector of length N)

    % Initialize coefficients
    a_k = zeros(1, N);
    a_k2 = zeros(1, N);

    % Compute the angular frequency
    wo = 2*pi/N; % fundamental frequency

    % Compute the Fourier coefficients
    for k = 1:N
        a_k(k) = (1/N) * sum(x .* exp(-1j*(k-1)*wo*(0:(N-1)))); % DFS coefficients
    end

    a_k2(1) = (1/N) * sum(x); % DC component
    a_k2(2:N) = (1/N) * (1-exp(-1j*(1:(N-1))*wo*5))./(1-exp(-1j*(1:(N-1))*wo)); % alternative formula for coefficients

end