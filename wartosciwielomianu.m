function [mx]=wartosciwielomianu(w_x,X,Y);
    dziedzina = (X(1,1)-1):0.1:(X(1,end)+1);
    mx=zeros(1,length(dziedzina));
    for i=1:length(dziedzina),
        ix = dziedzina(i);
        for j=1:length(w_x),
            mx(1,i)=mx(1,i)+w_x(j)*ix^(j-1);
        end
    end
end
