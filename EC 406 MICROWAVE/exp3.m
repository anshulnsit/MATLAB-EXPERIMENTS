% -*- coding: utf-8 -*-
% Created on Sun Oct 29 19:55:30 2017
% @author: LALIT ARORA
% Magnitude and Phase response of s21 and s11 for given circuit in frequency range [0,10] GHz 

% Definition of circuit elements
zo=50;
f=2e9;
c=3e8;
l=c/f;
zo2=217.5;
zo4=zo2;
w=linspace(0,10e9,1e3);
s11=zeros(1,1e3);
s21=zeros(1,1e3);
for i=1:(1e3)
    b=w(i)/c;
    y1=j*tan(b*l)/64.9;
    y3=j*tan(b*l)/70.3;
    y5=j*tan(b*l)/64.9;
    m1=[1 0 ; y1 1];
    m2=[(cos(b*l)) (j*zo2*sin(b*l)) ; (j*sin(b*l)/zo2) (cos(b*l))];
    m3=[1 0 ; y3 1];
    m4=m2;
    m5=m1;
    m=m1*m2*m3*m4*m5;
    A=m(1,1);
    B=m(1,2);
    C=m(2,1);
    D=m(2,2);
    s21(i)=2/( A + (B/zo) + (zo*C) + D );
    s11(i)= ( A + (B/zo) - (C*zo) - D)/( A + (B/zo) + (zo*C) + D );
end
% Plotting the magnitude and phase responses

subplot(2,2,1);
plot(w,abs(s11));
xlabel('Frequency (Hz)');
ylabel('s11 Parameter');
title('Magnitude response of s11');
subplot(2,2,2);
plot(w,angle(s11));
xlabel('Frequency (Hz)');
ylabel('s11 Parameter');
title('Phase response of s11');
subplot(2,2,3);
plot(w,abs(s21));
xlabel('Frequency (Hz)');
ylabel('s21 Parameter');
title('Magnitude response of s21');
subplot(2,2,4);
plot(w,angle(s21));
xlabel('Frequency (Hz)');
ylabel('s21 Parameter');
title('Phase response of s21');
