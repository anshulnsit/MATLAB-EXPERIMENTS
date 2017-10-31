% Non - Uniform Quantizer for Uniform and Gaussian random signal.

f=10;
N=1000;
% For Gaussian random signal 
 xg=-f + (2*f).*randn(1,N);
% For Uniform random signal
 xu=-f + (2*f).*rand(1,N);
% Adding Non Uniformitiy - U Law
u=250;
for i=1:N
    cmu(i)=log(1+(u*abs(xu(i)/f)))/log(1+u);
    cmg(i)=log(1+(u*abs(xg(i)/f)))/log(1+u);
    xu(i)=cmu(i);
    xg(i)=cmg(i);
end

% Computation
 for k=1:8
    L=2^k;
    del=20/L;
    sq=1:N;
    for j=1:N
        for i=1:L-1
            if ( ((-f+(i)*del)<=xu(j)) && ((-f+(i+1)*del)>=xu(j)))
                sq(j)=-f+(i*del)+(del/2);
            end;
            if (xu(j)==f)
                sq(j)=f-(del/2);
            end;
        end;
    end;
    qn=(1/N)*sum(abs(xu-sq));
    sp=(1/N)*sum(abs(xu));
    snru(k)=sp/qn;
end;
for k=1:8
    L=2^k;
    del=20/L;
    sq=1:N;
    for j=1:N
        for i=1:L-1
            if ( ((-f+(i)*del)<=xg(j)) && ((-f+(i+1)*del)>=xg(j)))
                sq(j)=-f+(i*del)+(del/2);
            end;
            if (xg(j)==f)
                sq(j)=f-(del/2);
            end;
        end;
    end;
    qn=(1/N)*sum(abs(xg-sq));
    sp=(1/N)*sum(abs(xg));
    snrg(k)=sp/qn;
end;

% Plotting
subplot(1,2,1);
plot(snru);
title('Uniform Quantizer for Uniform RS');
xlabel('Signal');
ylabel('SNR');
subplot(1,2,2);
plot(snrg);
title('Uniform Quantizer for Gaussian RS');
xlabel('Signal');
ylabel('SNR');