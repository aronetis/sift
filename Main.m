% The main file of the system
% Author: Dmitry Samal
% 17.03.2014

% Loading the image has to being processed
function [result_Flag] = Main(fname,block_size)
  
% Time start
t1 = clock;

if (nargin < 2)
    block_size = [16 16]; % Initialization of the size of the sliding window paramete
end

if (nargin < 1)
    [imagergb,fname] = read_image();    
else 
     [imagergb,MAP] = imread(fname);  
     
end;
format compact;
format shortg;



% Threshold of likehood (in percents)
% The minimal and maximal sizes of comparied objects

% The processing function calling
[flag,improc,J_image] = ImageProcessing(imagergb,block_size);

t2 = clock;
e = etime(t2,t1);
message = sprintf('The processing time is %4.3f seconds', e);
disp(message);

% The result representing
if flag
    figure(1);
    subplot(2,2,1);
    subimage(imagergb); %Input Image
    
    subplot(2,2,2);
    subimage(improc);   %Output Image
    
    subplot(2,2,3);
    subimage(J_image);   %Integral Image
end
 result_Flag = true;
end