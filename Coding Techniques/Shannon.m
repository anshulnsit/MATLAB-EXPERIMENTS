function y= Shanon(start,ends)
global prob;
global codewords;
cnt=ends-start+1;
if cnt==1
    return ;
end
if cnt==2
    codewords{start}=[codewords{start},0];
    codewords{start+1}=[codewords{start+1},1];
    return;
end
sx=0
for i=(start:ends)
    sx=sx+prob(i);
end
index=-1;
tx=0;
comp=5000;
for i=(start:ends)
    tx=tx+prob(i);
    sx=sx-prob(i);
    if (abs(tx-sx)<comp)
        comp=abs(tx-sx);
        index=i;
    end
end
for i=(start:index)
    codewords{i}=[codewords{i},0];
end
for i=(index+1:ends)
    codewords{i}=[codewords{i},1];
end
Shanon(start,index);
Shanon(index+1,ends);
end
