function[] = waveletcompress(input_image2)
global fid;

input_image = rgb2gray(input_image2);
input_image1=imnoise(input_image,'speckle',.01);  % Get some noise



figure (2);
imshow(input_image1);

n= 2;%input('enter the decomposition level=');

[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters('haar');

[c,s]=wavedec2(input_image1,n,Lo_D,Hi_D);

% disp(' the decomposition vector Output is');
% 
% disp(c);
t =0;
B_size = size(c);
fprintf(fid,'Size of Decomposition vector Output: %i \n',B_size(2));
for row=1:B_size(2)
    
    fprintf(fid, ' %.3f', c(row));
    
    t= t+1;
    if t>100
        fprintf(fid, ' \n');
        t = 0;
    end
end

fprintf(fid, ' \n');

[thr,nkeep] = wdcbm2(c,s,1.5,3*prod(s(1,:)));

 [compressed_image,TREED,comp_ratio,PERFL2] =wpdencmp(thr,'s',n,'haar','threshold',5,1);

 disp('compression ratio in percentage');

 disp(comp_ratio);

  re_ima1 = waverec2(c,s,'haar'); 

 re_ima=uint8(re_ima1);

  subplot(1,3,1);

 imshow(input_image1);

 title('i/p image');

 subplot(1,3,2);

 imshow(compressed_image);

 title('compressed image');

 subplot(1,3,3);

 imshow(re_ima);

 title('reconstructed image');
end