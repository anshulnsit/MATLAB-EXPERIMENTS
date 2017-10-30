function [ snr ] = calsnr( x )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
for k=1:8
    L=2^k
    del=20/L;
    sq=1:N;
    for j=1:N
        for i=1:L-1
            if ( ((-f+(i)*del)<=x(j)) && ((-f+(i+1)*del)>=x(j)))
                sq(j)=-f+(i*del)+(del/2);
            end;
            if (x(j)==f)
                sq(j)=f-(del/2);
            end;
        end;
    end;
    qn=(1/N)*sum(abs(x-sq));
    sp=(1/N)*sum(abs(x));
    snr(k)=sp/qn;
end;

end

