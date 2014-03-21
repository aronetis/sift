


Dust


%-------
J_image = double(I_gray);
fprintf(fid,'J_image size: %i \n', size(J_image));
B_image = blockproc(J_image,[1,1],@Block_sum,'BorderSize',[1,1], 'TrimBorder', false,'UseParallel',true); % Compute function wnd_sum for each sliding window of the integral image 

[D_array,E_array] = Histstat(B_image,max(max(B_image)));
fprintf(fid,'E_grey: %i \n', E_array);
%-------

%-------
J_image = double(I_red);
B_image = blockproc(J_image,[1,1],@Block_sum,'BorderSize',[1,1], 'TrimBorder', false,'UseParallel',true); % Compute function wnd_sum for each sliding window of the integral image 
[D_array,E_array] = Histstat(B_image,max(max(B_image)));
fprintf(fid,'E_red: %i \n', E_array);
%-------

%-------
J_image = double(I_grn);
B_image = blockproc(J_image,[1,1],@Block_sum,'BorderSize',[1,1], 'TrimBorder', false,'UseParallel',true); % Compute function wnd_sum for each sliding window of the integral image 
[D_array,E_array] = Histstat(B_image,max(max(B_image)));
fprintf(fid,'E_grn: %i \n', E_array);
%-------

%-------
J_image = double(I_blu);
B_image = blockproc(J_image,[1,1],@Block_sum,'BorderSize',[1,1], 'TrimBorder', false,'UseParallel',true); % Compute function wnd_sum for each sliding window of the integral image 
[D_array,E_array] = Histstat(B_image,max(max(B_image)));
fprintf(fid,'E_blu: %i \n', E_array);
%-------