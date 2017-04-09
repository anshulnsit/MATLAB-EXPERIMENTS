close all;
clear all;
N = 100000;
M = 1000;
x=randn(1,N);
x1 = min(x)-0.3;
x2 = max(x)+0.3;
d = (x2 - x1)/M;
z = zeros(1,M);
for i = 1:M,c = 0;
    for j = 1:N
        if((x1+(i-1)*d) <= x(j) && x(j) < (x1 + i*d))
            c = c+1;
        end
        z(i) = c/(N*d);
    end
end
h = x1:d:x2-d;
plot(h,z);
M = (sum(h.*z))*d;
M1 = mean(x);
V = (sum(((h-M).^2).*z))*d;