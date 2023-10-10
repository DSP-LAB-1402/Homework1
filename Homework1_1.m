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

%%%
