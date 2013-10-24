function [mx]=wartosciwielomianu(w_x,X,Y,D);
    mx=zeros(1,length(D));
    for i=1:length(D),
        ix = D(i);
        for j=1:length(w_x),
            mx(1,i)=mx(1,i)+w_x(j)*ix^(j-1);
        end
    end
end
