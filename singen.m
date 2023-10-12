%% *Singen function*

function [sine_dis] = singen(n,w0)
num = [0 sin(w0)];
den = [1 -2*cos(w0) 1];
t = 0:1:n-1;
n1 = length(t);
delta = zeros(n1,1);
delta(t == 0) = 1;
sine_dis = filter(num,den,delta);
end