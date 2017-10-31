% SHANON FANO Coding

clear all;
close all;

m=input('Enter the number of message ensembles: ');
z=[]
h=0;
l=0;
display('Enter the probabilities in descending order');
for i=1:m
    fprintf('Ensemble %d\n',i);
    p(i)=input('');
end
a(1)=0;
for j=2:m
    a(j)=a(j-1)+p(j-1);
end
for i=1:m
    n(i)=ceil(-1*(log2(p(i))));
end
for i=1:m
    int=a(i);
    for j=1:n(i)
        frac=int*2;
        c=floor(frac);
        frac=frac-c;
        z=[z c];
        int=frac;
    end
    fprintf('Codeword %d ',i);
    display(z);
    z=[];
end


