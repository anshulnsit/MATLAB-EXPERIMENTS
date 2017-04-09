x = -10 : 1 : 10;
y = 1;
while(ne(x,0))
    y = sin(pi*x)/(pi*x);
end
plot(y);
grid;