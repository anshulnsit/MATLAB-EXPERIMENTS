close all;
clear all;
N = 50000;
M = 100;
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