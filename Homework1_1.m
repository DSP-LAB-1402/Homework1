%% *Homework 1*

%% Clear the workspace
close all;
clear;
clc;

%% Homework 1_1
%
% This cell is about, plotting Sine wave with "plot function" and "stem function"
%
% Now we declare variables first
%
Ts = 0.01;
amp = 2;
t = 0:Ts:2;
f0 = 1;
w = 2 * pi * f0;
signal = amp * sin(w * t);
%%%
% Now we plot signla with two functions "plot and stem"
%
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
%
% This cell is about showing uniform random noise and adding it with sinusoidal wave
% Now first declare variables that we need for this task
%
Ts = 0.01;
amp = 2;
t = 0:Ts:2;
f0 = 1;
w = 2 * pi * f0;
signal = amp * sin(w * t);
size_t = size(t);
%%%
% Here we declare the signals we want to plot
%
stochastic_signal = rand(1, size_t(2)) - 0.5;
noisy_signal = signal + stochastic_signal;
%%%
% Plotting the Uniform Noise Signal
%
figure('Name', 'Uniform Noise Signal');
plot(t, stochastic_signal);
title('Uniform Noise Signal');
xlabel('Sample');
ylabel('Amplitude');
grid on;
%%%
% Plotting sine wave with and without noise
%
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
%
% In this task we use "conv" function to convolve sinusoidal wave with "Moving average"
% This task splits in two parts:
% Firstly, we have M1=0,M2=20 so we should designate variables in order to meet the needs
%
% Now we declare variables
Ts = 0.01;
amp = 2;
t = 0:Ts:2;
f0 = 1;
w = 2 * pi * f0;
signal = amp * sin(w * t);
size_t = size(t);
M1 = 0;
M2 = 20;
amp_mov = 1 / (M1 + M2 + 1);
uni = ones(1, M1 + M2 + 1);
%%%
% Here we declare the signals needed to plot
%
stochastic_signal = rand(1, size_t(2)) - 0.5;
noisy_signal = signal + stochastic_signal;
smoothed_sine = amp_mov * conv(noisy_signal, uni, 'same');
%%%
% Here we plot the Signal after convolution and before convolution
%
figure('Name', 'Moving Averaged Sine');
plot(t, smoothed_sine);
title('Moving Averaged Sine');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
hold on
plot(t, signal);
legend("Convolved Signal", "Original Signal");
%
%% homework1_3_2
% In this part we want to do the same as latest task but with different M1 and M2
% We set M1=M2=10 and try to plot the wave and see how much difference it shows
%
% Now we declare variables needed to complete the task
Ts = 0.01;
amp = 2;
t = 0:Ts:2;
f0 = 1;
w = 2 * pi * f0;
signal = amp * sin(w * t);
size_t = size(t);
M1 = 10;
M2 = 10;
amp_mov = 1 / (M1 + M2 + 1);
%%%
% Here we declare signals needed to plot
stochastic_signal = rand(1, size_t(2)) - 0.5;
noisy_signal = signal + stochastic_signal;
uni = ones(1, 21);
smoothed_sine = amp_mov * conv(uni, noisy_signal);
shifted_sine = smoothed_sine(M1 + M2 + 1:end);
%%%
% We plot convolved signal and sine signal
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
%%%
% After plotting we see that we have delays when we are using conv function
% Also we see that if we use M1=M2=10 compare to M1=0, M2=20, we have more delays

%% Homework1_4
% The purpose of this task is using filter function and compare it with conv function
%
% Here first we declare needed variables
Ts = 0.01;
amp = 2;
t = 0:Ts:2;
f0 = 1;
w = 2 * pi * f0;
signal = amp * sin(w * t);
size_t = size(t);
M1 = 0;
M2 = 20;
amp_mov = 1 / (M1 + M2 + 1);
n = -M1:M2;
N = size_t(2);
%%%
% Here we declare Signals needed to plot
stochastic_signal = rand(1, size_t(2)) - 0.5;
noisy_signal = signal + stochastic_signal;
uni = ones(1, M1 + M2 + 1);
transfer_function = amp_mov * uni;
filtered_signal = filter(transfer_function, 1, noisy_signal);
smoothed_sine = amp_mov * conv(noisy_signal, uni, 'same');
%%%
% Now we plot signals with "conv" and "filter"
% We demonstrate the shifts and differences of signals with one another
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
