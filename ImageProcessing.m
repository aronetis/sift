% The main file of the system
% Author: Dmitry Samal
% 17.03.2014

function [result_Flag,improc,improc2] = ImageProcessing(imagergb,block_size,T_delta)

global fid;

N_image =  imresize(imagergb,0.256,'bilinear'); % Get smaller image of 1/4 size of the gray image
I_gray = rgb2gray(N_image);       % Get the gray variant image of the original one
I_red = N_image(:,:,1);
I_grn = N_image(:,:,2);
I_blu = N_image(:,:,3);
                            %J_image =  integralImage(N_image); % Compute the integral image of the processing one
%-------
J_image = double(I_gray);
fprintf(fid,'J_image size: %i \n', size(J_image));
B_gray = blockproc(J_image,[1,1],@Block_sum,'BorderSize',[1,1], 'TrimBorder', false,'UseParallel',true); % Compute function wnd_sum for each sliding window of the integral image 

J_image = double(I_red);
B_red = blockproc(J_image,[1,1],@Block_sum,'BorderSize',[1,1], 'TrimBorder', false,'UseParallel',true); % Compute function wnd_sum for each sliding window of the integral image 
J_image = double(I_grn);
B_grn = blockproc(J_image,[1,1],@Block_sum,'BorderSize',[1,1], 'TrimBorder', false,'UseParallel',true); % Compute function wnd_sum for each sliding window of the integral image 
J_image = double(I_blu);
B_blu = blockproc(J_image,[1,1],@Block_sum,'BorderSize',[1,1], 'TrimBorder', false,'UseParallel',true); % Compute function wnd_sum for each sliding window of the integral image 

s_max = max([max(max(B_gray)) max(max(B_red)) max(max(B_grn)) max(max(B_blu))]);
s_min = min([min(min(B_gray)) min(min(B_red)) min(min(B_grn)) min(min(B_blu))]);

figure(2);
[D_array,E_array] = Histstat3(B_gray,B_red,B_grn,B_blu,[s_max s_min],T_delta);
fprintf(fid,'E_3: %i \n', E_array);
%-------



%D_image = mat2gray(B_image/16, [0 256]);

hist(D_array);

figure(3);
hist(E_array);
%     subimage(C_image);

% Return some of the temporal images to the main program 
improc = I_gray; 
improc2 = N_image;

result_Flag = true;
end