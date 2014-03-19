% The main file of the system
% Author: Dmitry Samal
% 17.03.2014

function [result_Flag,improc,improc2] = ImageProcessing(imagergb,block_size)

I_gray = rgb2gray(imagergb);       % Get the gray variant image of the original one
N_image =  imresize(I_gray,0.256,'nearest'); % Get smaller image of 1/4 size of the gray image

J_image =  integralImage(N_image); % Compute the integral image of the processing one

% block_sum = @(block_struct) ...
%  block_struct.data(block_struct.blockSize(1),block_struct.blockSize(2))- block_struct.data(1,1);

B_image = blockproc(J_image,block_size,@Block_sum,'UseParallel',true); % Compute function wnd_sum for each sliding window of the integral image 
hist(B_image);
% Show some intermediate results 
% figure(2);
%     subplot(2,2,1);
%     subimage(I_gray);
%     
%     subplot(2,2,2);
%     subimage(N_image);

% Return some of the temporal images to the main program 
improc = I_gray; 
improc2 = B_image;

result_Flag = true;
end