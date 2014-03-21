function [ J ] = jasnosc( image )
[M N K]=size(image);
J=0;
for i=1:M,
    for j=1:N,
        J=J+image(i,j);
    end
end
J=J/(M*N);
end

