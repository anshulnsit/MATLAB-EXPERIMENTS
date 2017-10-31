% QPSK Modulation
close all;
clear all;
N=1000;
y=randi(N,[N,1]);
y1=mod(y,2);
for i=1:2:1000
    if(y1(i)==0)
        if (y1(i+1)==0)
            phi((i+1)/2)=pi/4;
        else phi((i+1)/2) = 3*(pi/4);
        end;
    end;
    if(y1(i)==1)
        if (y1(i+1)==0)
            phi((i+1)/2)=5*(pi/4);
        else phi((i+1)/2) = 7*(pi/4);
        end;
    end;
    SI((i+1)/2)=4*(cos(phi((i+1)/2)));
    SQ((i+1)/2)=4*(sin(phi((i+1)/2)));
end;
NI=randn(1,500);
NQ=randn(1,500);
RI=SI+NI;
RQ=SQ+NQ;

for i=1:2:1000
    if RI((i+1)/2)>0 && RQ((i+1)/2)>0 
        M(i)=0;
        M(i+1)=0;
    end;
    if RI((i+1)/2)<0 && RQ((i+1)/2)>0 
        M(i)=0;
        M(i+1)=1;
    end;
    if RI((i+1)/2)<0 && RQ((i+1)/2)<0 
        M(i)=1;
        M(i+1)=0;
    end;
    if RI((i+1)/2)>0 && RQ((i+1)/2)<0 
        M(i)=1;
        M(i+1)=1;
    end;
end;
M=M.';
err=sum(xor(y1,M));
Pe=err/N;
SI2=SI.^2;
SQ2=SQ.^2;
NI2=NI.^2;
NQ2=NQ.^2;
SP=sum(SI2+SQ2);
NP=sum(NI2+NQ2);
SQNR=SP/NP;
    
display('Prabability');
display(Pe);
display('Signal Power');
display(SP);
display('Noise Power');
display(NP);
display('Signal to Noise Ratio');
display(SQNR);