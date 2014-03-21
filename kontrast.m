function [ C ] = kontrast( image, J )
[M N K]=size(image);
C=0;
for i=1:M,
    for j=1:N,
        C=C+(image(i,j)-J)^2;
    end
end
C=C/(M*N);
C=sqrt(C);
end
