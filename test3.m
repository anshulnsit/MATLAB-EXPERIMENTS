t=linspace(-100,100,1000);
y=sinc(t);
z=fft(y);
plot(fftshift(abs(z)));