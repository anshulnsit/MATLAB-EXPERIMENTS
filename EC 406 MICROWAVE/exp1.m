% -*- coding: utf-8 -*-
% Created on Sun Oct 29 19:18:59 2017
% @author: LALIT ARORA
% Magnitude and Phase response of s21 and s11 for given circuit in frequency range [0,10] GHz 

% Definition of circuit elements
zo=50;
c1=0.984e-12;
c3=3.183e-12;
c5=c1;
l2=6.438e-9;
l4=l2;
w=linspace(0,10e9,1e3);
s11=zeros(1,1e3);
s21=zeros(1,1e3);
% Computation of s21 and s11 vectors.
for i=1:(1e3) 
    m1=[1 0 ; (j*w(i)*c1) 1];
    m2=[1 (j*w(i)*l2) ; 0 1];
    m3=[1 0 ; (j*w(i)*c3) 1];
    m4=m2;
    m5=m3;
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
