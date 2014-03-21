% The function to build special type of histograam
% Author: Dmitry Samal
% 19.03.2014

function [b_vector,c_vector] = Histstat(matrix,max_value)
global fid;

q = max_value+1;
b_vector = zeros(q,1);
[m,n] = size(matrix);
r=m*n;
for i = 1:r 
    b_vector(floor(matrix(i))+1) = b_vector(matrix(i)+1)+1;
end
% p=0;
% 
% for l = 1: q
%     if b_vector(l)> 0
%         p = p+1;
%     end
% end

% w = 0;
t = max(b_vector);
c_vector = zeros(t,1);
for j = 1:q
    f = b_vector(j);
    if f ~=0
     c_vector(f) = c_vector(f)+1;
%      w=w+1;
    end
    
   % fprintf(fid,'j = %i',j,' b_vector(j): %i \n',b_vector(j)); %debug
end
end


