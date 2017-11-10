% Huffman Coding
clear all;
% Take Probabilities
probabilities = [ 0.3 0.25 0.2 0.15 0.1];
% Normalise the probabilities
probabilities = probabilities/sum(probabilities);
% Define sets
% Codewords will take codes for the probabilites (final code words)
% set_contents will contain these codewords for deciding
% set_probabilities will contain the probabilities (will go from 5 to 2)
for index = 1:length(probabilities)
    codewords{index} = [];
    set_contents{index} = index;
    set_probabilities(index) = probabilities(index);
end
% While loop sorts the set_probabilites with symbols and probabilties
% Then find the lowest probabiity and append 0 to codeword for its index
% Find the second lowest probability and append 1 to codeword for its index
% Remove these probabilities from set_contents and add the cell containing
% removed symbols in it
% Remove probabilities from the set_probabilites and append their addition
% for next iteration
while length(set_contents) > 1
    [temp, sorted_indices] = sort(set_probabilities);
    zero_set = set_contents{sorted_indices(1)};
    zero_probability = set_probabilities(sorted_indices(1));
    for codeword_index = 1:length(zero_set)
        codewords{zero_set(codeword_index)} = [codewords{zero_set(codeword_index)}, 0];       
    end
    one_set = set_contents{sorted_indices(2)};
    one_probability = set_probabilities(sorted_indices(2));
    for codeword_index = 1:length(one_set)
        codewords{one_set(codeword_index)} = [codewords{one_set(codeword_index)}, 1];       
    end
    set_contents(sorted_indices(1:2)) = [];
    set_contents{length(set_contents)+1} = [zero_set, one_set];
    set_probabilities(sorted_indices(1:2)) = [];
    set_probabilities(length(set_probabilities)+1) = zero_probability + one_probability;
end
% Display codes of all symbols using codewords cells. Displaying in reverse
% order
for index = 1:length(codewords)
    disp([num2str(index), '    ', num2str(probabilities(index)),'    ',num2str(codewords{index}(length(codewords{index}):-1:1))]);
end
% Entropy sum[ plog[1/p] ]
entropy = sum(probabilities.*log2(1./probabilities));
% Avg Length [length*p] . We pronounce it as L'.
av_length = 0;
for index = 1:length(codewords)
    av_length = av_length + probabilities(index)*length(codewords{index});
end
% Displaying calculated contents
disp(['The symbol entropy is:                     ',num2str(entropy)]);
disp(['The average Huffman codeword length is:    ',num2str(av_length)]);
disp(['The Huffman coding rate is:                ',num2str(entropy/av_length)]);
