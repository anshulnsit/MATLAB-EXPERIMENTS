% HUFFMAN Code

clear all;
close all;
sig=1:4;
Symbols=[1 2 3 4];
P=[0.1 0.3 0.4 0.2];
% Using Inbuilt Functions 
dict=huffmandict(Symbols,P);
temp=dict;
for i=1:length(temp)
    temp{i,2}=num2str(temp{i,2});
end
disp(temp);
% Using Inbuilt Functions for encoding and decoding Huffman Codes
hcode=huffmanenco(sig,dict);
dhsig=huffmandeco(hcode,dict);
disp('Encoded Huffman Code ');
disp(hcode);
disp('Decoded Huffman Code ');
disp(dhsig);