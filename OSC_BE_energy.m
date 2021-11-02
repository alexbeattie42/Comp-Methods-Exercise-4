%% Exercise 4.10: Compute the energy in oscillations
%   Based on the file osc_EC.m 
clear;clc;close;

omega = 2;
P = 2*pi/omega;
% dt = P/20;
dt = P/2000;
T = 3*P;
N_t = floor(round(T/dt));
t = linspace(0, N_t*dt, N_t+1);

u = zeros(N_t+1, 1);
v = zeros(N_t+1, 1);

% Initial condition
X_0 = 2;
u(1) = X_0;
v(1) = 0;

% Step equations forward in time
for n = 2:N_t+1
    u(n) = (1 /(1 + (dt * omega)^2)) * (dt * v(n-1) + u(n - 1));
    v(n) = (1 /(1 + (dt * omega)^2)) * (-dt * omega^2 * u(n - 1) + v(n - 1));
end

calc_u = X_0*cos(omega * t);
plot(t, u, 'r--', t, calc_u , 'k-');
legend('calculated', 'correct', 'Location', 'southeast');
xlabel('time');