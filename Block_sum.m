%The function of sliding window pixel sum calculation
% Author: Dmitry Samal
% 18.03.2014

function [sum] = Block_sum(block_struct)
% N = block_struct.blockSize(1);
% M = block_struct.blockSize(2);
% ul = block_struct.data(1,1);
% ur = block_struct.data(1,M);
% dl = block_struct.data(N,1);
% dr = block_struct.data(N,M);
%sum = dr + ul - ur - dl;

% The fastest version of the processing
sum = block_struct.data(block_struct.blockSize(1),block_struct.blockSize(2))...
    + block_struct.data(1,1) - block_struct.data(1,block_struct.blockSize(2))...
    - block_struct.data(block_struct.blockSize(1),1);


end