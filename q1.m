x = -10:0.03:10;
y = sinc(x);
z = fft(y);
w = fftshift(z);
plot(w);
grid;