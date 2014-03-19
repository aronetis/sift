% The batch processing  of test images
% Author: Dmitry Samal
% 18.03.2014

% Loading all images has to being processed from the input directory
function [result_Flag] = BatchTest(PathName,block_size)

if (nargin < 2)
    block_size = [16 16]; % Initialization of the size of the sliding window paramete
end

if (nargin < 1)
    [PathName] = uigetdir();
end

imagefiles = dir([PathName '/']); % Read the names of all files in the folder

k = length(imagefiles);
for d = 1:k
    % Check file names for the image types
    test_image_name = [PathName '/' imagefiles(d).name];
    t= length(test_image_name);
    end_of_test_image_name = [test_image_name(t-2) test_image_name(t-1) test_image_name(t)];
    str = sprintf(end_of_test_image_name);
    
    % Add here the types of image files to be processed (for example 'gif')
    if strcmp(str,'JPG') || strcmp(str,'jpg') || strcmp(str,'png') || strcmp(str,'PNG') || strcmp(str,'bmp') || strcmp(str,'BMP')|| strcmp(str,'tif') || strcmp(str,'TIF')
        
    Main(test_image_name,block_size); 
    end
end

result_Flag = true;
end