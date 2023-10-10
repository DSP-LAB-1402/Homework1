%% *Homework 1*

%% Clear the workspace
close all;
clear;
clc;

%% Homework 1_1

Ts = 0.01;
amp = 2;
t = 0:Ts:2;
f = 1;
w = 2*pi*f;
signal = amp*sin(w*t);
figure('Name', 'Sine Plot');
plot(t,signal, 'LineWidth', 0.5);
xlabel('Time (s)');
ylabel('Amplitude');
title('Sine Function');
figure('Name', 'Sine Plot');
stem(t,signal, 'LineWidth', 0.5);
xlabel('Time (s)');
ylabel('Amplitude');
title('Sine Function');

%% Homework1_2

Ts = 0.01;
amp = 2;
t = 0:Ts:2;
f = 1;
w = 2*pi*f;
signal = amp*sin(w*t);
size_t = size(t);
stochastic_signal = rand(1,size_t(2)) - 0.5;

figure('Name', 'Uniform Noise Signal');
plot(t, stochastic_signal);
title('Uniform Noise Signal');
xlabel('Sample');
ylabel('Amplitude');
grid on;

figure('Name', 'Sine Waves');
subplot(2,1,1)
plot(t, signal);
title('Sine Function');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
noisy_signal = signal + stochastic_signal;
subplot(2,1,2)
plot(t, noisy_signal);
title('Noisy sine');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

