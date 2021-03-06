% The main file of the system
% Author: Dmitry Samal
% 17.03.2014

% Loading the image has to being processed
function [result_Flag] = Main(fname,block_size,PathName)
  
% Time start
t1 = clock;
T_delta = 0.1; %
if (nargin < 2)
    block_size = [16 16]; % Initialization of the size of the sliding window paramete
end

if (nargin < 1)
    [imagergb,fname] = read_image();    
else 
     [imagergb,MAP] = imread([PathName '/' fname]);  
     
end;
format compact;
format shortg;

%Whrite a log file
global fid
fid = fopen('log_.txt','at');
fprintf(fid,'File name: %s\n', fname);

% Threshold of likehood (in percents)
% The minimal and maximal sizes of comparied objects

% The processing function calling
  [flag,improc,J_image] = ImageProcessing(imagergb,block_size,T_delta);
  
            %Cut_frame(fname,[32 32],16,'E:\aActive projects_�������� �������\Odesk\First\Test');

t2 = clock;
e = etime(t2,t1);
message = sprintf('The processing time is %4.3f seconds', e);
disp(message);
fprintf(fid,'%s\n', message);


fclose(fid);
% The result representing
if flag
    figure(1);
    subplot(2,2,1);
    subimage(imagergb); %Input Image
    
    subplot(2,2,2);
    subimage(improc);   %Output Image
    
%     subplot(2,2,3);
%     subimage(J_image);   %Integral Image
end 
 result_Flag = true;
end