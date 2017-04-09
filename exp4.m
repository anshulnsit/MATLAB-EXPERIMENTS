close all;
clear all;
n = 20;
x = rand(1,n);
mu1 = 0;
for i = 1:1:n
   mu1 = mu1 + x(i); 
end
mu1 = mu1/n;
var1 = 0;
for i = 1:1:n
   var1 = var1 + (x(i) - mu1) * (x(i) - mu1);  
end
var1 = var1 / n;
mu2 = mean(x);
var2 = var(x);