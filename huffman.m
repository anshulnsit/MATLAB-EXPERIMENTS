% Huffman Test
clear all;
prob=[0.3 0.25 0.2 0.15 0.1];

% Assigning
for i = 1:length(prob)
    codewords{i}=[];
    set_contents{i}=i;
    set_prob(i)=prob(i);
end

% Looping
while length(set_contents)>1
    [temp,sorted_in]=sort(set_prob);
    zero_set=set_contents{sorted_in(1)};
    zero_prob=set_prob(sorted_in(1));
    for i=1:length(zero_set)
        codewords{zero_set(i)}=[codewords{zero_set(i)},0];
    end
    one_set=set_contents{sorted_in(2)};
    one_prob=set_prob(sorted_in(2));
    for i=1:length(one_set)
        codewords{one_set(i)}=[codewords{one_set(i)},1];
    end
    set_contents(sorted_in(1:2))=[];
    set_contents{length(set_contents)+1}=[zero_set,one_set];
    set_prob(sorted_in(1:2))=[];
    set_prob(length(set_prob)+1)=zero_prob+one_prob;
end

for i=1:length(codewords)
    disp(['Symbol ',num2str(i),' has codeword = ',num2str(codewords{i})]);
end
entropy=sum(prob.*log2(1./prob));
av_length=0;
for i=1:length(codewords)
    av_length=av_length+(prob(i)*length(codewords{i}));
end
disp(entropy);
disp(av_length);
disp(entropy/av_length);
    