% The function to build special type of histograam
% Author: Dmitry Samal
% 19.03.2014

function [b_vector,c_vector] = Histstat3(matrix_A,matrix_B,matrix_C,matrix_D,s_max,s_min,T_delta);
global fid;
Delta = floor((s_max-s_min)*T_delta/2);
q = s_max+1;
b_vector = zeros(q,1);
b_red = zeros(q,1);
b_grn = zeros(q,1);
b_blu = zeros(q,1);

[m,n] = size(matrix_A);
r=m*n;
for i = 1:r 
    z = matrix_A(i);
    if (b_vector(z+1) >0)
        % So we have to check
        if (b_red(z+1) == matrix_B(i) && b_grn(z+1) == matrix_C(i) && b_blu(z+1) == matrix_D(i))
            
            b_vector(z+1) = b_vector(z+1)+1;    
        end 
    else
        b_vector(z+1) = b_vector(z+1)+1;     
        b_red(z+1) = matrix_B(i);
        b_grn(z+1) = matrix_C(i);
        b_blu(z+1) = matrix_D(i);        
    end
end
p=0;

for l = 1: q
    if b_vector(l)> 1
        p = p+1;
    end
end

w = 0;
t = max(b_vector);
c_vector = zeros(t,1);
for j = 1:q
    f = b_vector(j);
    if f ~=0
     c_vector(f) = c_vector(f)+1;
     w=w+1;
    end
    
   % fprintf(fid,'j = %i',j,' b_vector(j): %i \n',b_vector(j)); %debug
end
end


