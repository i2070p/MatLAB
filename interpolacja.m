function [mx] = interpolacja(X,Y);
    i_p=length(X);
    V=zeros(i_p);
    for n=1:i_p,
        for o=1:i_p,
            V(n,o)=X(1,n)^(o-1);
        end
    end
    mx=(inv(V)*Y')';
end
