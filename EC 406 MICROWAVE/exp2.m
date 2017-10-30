% -*- coding: utf-8 -*-
% Created on Sun Oct 29 19:48:50 2017
% @author: LALIT ARORA
% Magnitude and Phase response of s21 and s11 for given circuit in frequency range [0,10] GHz 

% Definition of circuit elements
zo=50;
c1=0.199e-12;
c2=34.91e-12;
c3=c1;
l1=127e-9;
l2=0.726e-9;
l3=l1;
w=linspace(0,10e9,1e3);
s11=zeros(1,1e3);
s21=zeros(1,1e3);
% Computation of s21 and s11 vectors.
for i=1:(1e3) 
    m1=[1 (j*w(i)*l1) ; 0 1];
    m2=[1 (1/(j*w(i)*c1)) ; 0 1];
    m3=[1 0 ; (1/(j*w(i)*l2)) 1];
    m4=[1 0 ; (j*w(i)*c2) 1];
    m5=m1;
    m6=m2;
    m=m1*m2*m3*m4*m5*m6;
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
