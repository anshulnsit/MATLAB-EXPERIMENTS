function test2
n = linspace(-10,10);
y = sincfunction(n);
plot(n,y);
grid;
function z = sincfunction(n)
if(eq(n,0))
    z = 1;
else
    z = sin(pi*n)/(pi*n);
end
end
end