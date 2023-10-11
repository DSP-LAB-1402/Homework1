%% *Homework 1*

%% Clear the workspace
close all;
clear;
clc;

%% Homework 1_1

% This cell is about, plotting Sine wave with "plot function" and "stem function"
% Now we declare variables first

Ts = 0.01;
amp = 2;
t = 0:Ts:2;
f0 = 1;
w = 2 * pi * f0;
signal = amp * sin(w * t);

% Now we plot signla with two functions "plot and stem"

figure('Name', 'Sine Plot');
plot(t, signal, 'LineWidth', 0.5);
xlabel('Time (s)');
ylabel('Amplitude');
title('Sine Function');
grid on;
figure('Name', 'Sine Stem');
stem(t, signal, 'LineWidth', 0.5);
xlabel('Time (s)');
ylabel('Amplitude');
title('Sine Function');
grid on;

%% Homework1_2

% This cell is about showing uniform random noise and adding it with sinusoidal wave
% Now first declare variables that we need for this task

Ts = 0.01;
amp = 2;
t = 0:Ts:2;
f0 = 1;
w = 2 * pi * f0;
signal = amp * sin(w * t);
size_t = size(t);
stochastic_signal = rand(1, size_t(2)) - 0.5;
noisy_signal = signal + stochastic_signal;

% Plotting the Uniform Noise Signal

figure('Name', 'Uniform Noise Signal');
plot(t, stochastic_signal);
title('Uniform Noise Signal');
xlabel('Sample');
ylabel('Amplitude');
grid on;

% Plotting sine wave with and without noise

figure('Name', 'Sine Waves');
subplot(2, 1, 1)
plot(t, signal);
title('Sine Function');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(2, 1, 2)
plot(t, noisy_signal);
title('Noisy sine');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

%% Homework1_3

Ts = 0.01;
amp = 2;
t = 0:Ts:2;
f0 = 1;
w = 2 * pi * f0;
signal = amp * sin(w * t);
size_t = size(t);
stochastic_signal = rand(1, size_t(2)) - 0.5;
noisy_signal = signal + stochastic_signal;

M1 = 0;
M2 = 20;
amp_mov = 1 / (M1 + M2 + 1);
n = -M1:M2;
N = size_t(2);
uni = ones(1, M1 + M2 + 1);
smoothed_sine = amp_mov * conv(noisy_signal, uni, 'same');
figure('Name', 'Moving Averaged Sine');
plot(t, smoothed_sine);
title('Moving Averaged Sine');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
hold on
plot(t, signal);
legend("Convolved Signal", "Original Signal");

%% homework1_3_2
Ts = 0.01;
amp = 2;
t = 0:Ts:2;
f0 = 1;
w = 2 * pi * f0;
signal = amp * sin(w * t);
size_t = size(t);
stochastic_signal = rand(1, size_t(2)) - 0.5;
noisy_signal = signal + stochastic_signal;

M1 = 10;
M2 = 10;
amp_mov = 1 / (M1 + M2 + 1);
n = -M1:M2;
N = size_t(2);

uni = ones(1, 21);
smoothed_sine = amp_mov * conv(uni, noisy_signal);
shifted_sine = smoothed_sine(M1 + M2 + 1:end);
figure('Name', 'Moving Averaged Sine');
subplot(2, 1, 1)
plot(t, shifted_sine);
title('shifted Sine');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
subplot(2, 1, 2)
plot(t, signal);
title('sine');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
%% Homework1_4

Ts = 0.01;
amp = 2;
t = 0:Ts:2;
f0 = 1;
w = 2 * pi * f0;
signal = amp * sin(w * t);
size_t = size(t);
stochastic_signal = rand(1, size_t(2)) - 0.5;
noisy_signal = signal + stochastic_signal;
M1 = 0;
M2 = 20;
amp_mov = 1 / (M1 + M2 + 1);
n = -M1:M2;
N = size_t(2);
uni = ones(1, M1 + M2 + 1);
transfer_function = amp_mov * uni;
filtered_signal = filter(transfer_function, 1, noisy_signal);
smoothed_sine = amp_mov * conv(noisy_signal, uni, 'same');
figure('Name', 'Moving Averaged Sine');
plot(t, smoothed_sine);
title('Moving Averaged Sine');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
hold on
plot(t, filtered_signal);
legend("Convolved Signal", "filtered Signal");
%% Homework1_5
