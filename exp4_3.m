close all;
clear all;
n = 20;
x1 = rand(1,n);
x2 = randn(1,n);
y1 = zeros(1,n);
y2 = zeros(1,n);
a = 2;
b = 5;
for i = 1:1:n
   y1(i) = a * x1(i) + b; 
   y2(i) = a * x2(i) + b;
end

m1_builtIn = mean(y1);
m1_calc = a/2 + b;
v1_builtIn = var(y1);
v1_calc = a * a /12;
m2_builtIn = mean(y2);
m2_calc = b;
v2_builtIn = var(y2);
v2_calc = a *a;