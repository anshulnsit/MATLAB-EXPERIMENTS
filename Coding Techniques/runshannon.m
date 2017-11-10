global prob;
global codewords;
prob=[0.3 0.25 0.2 0.15 0.1];
for i=1:length(prob)
    codewords{i}=[];
end;
Shannon(1,length(prob));
for i=1:length(codewords)
    disp(['Codeword for Symbol ',num2str(i),' is = ',num2str(codewords{i})]);
end;
