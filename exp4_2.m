close all;
clear all;
n = 20;
x = rand(1,n);
y = zeros(1,n);
a = 2;
b = 5;
mu1 = 0;
for i = 1:1:n
   y(i) = a * x(i) + b; 
    mu1 = mu1 + x(i);
end
mu1 = mu1/n;
m1 = mean(y);
m2 = a * mu1 + b;