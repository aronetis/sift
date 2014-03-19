% 4itaet izobrajenie iz faila
% output: image, name of file image
% vizov iz drugoi programmi: [L,filename] = read_image;
% function [out1, out2, ...] = funname(in1, in2, ...)

function [img, fn] = read_image()
%h = msgbox('Вошли в read_image','Matlab'); 

[FileName,PathName] = uigetfile('*.*','Select the image');   %Otkritie faila
pn_fn = [PathName, FileName];
fn = FileName;
[img] = imread(pn_fn);
% figure;
% imshow(img);