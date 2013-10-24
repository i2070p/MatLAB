function [mx] = aproksymacja(X,Y,r);
    len=length(X);
    S=zeros(r);
    T=zeros(r);
    F=zeros(r,1);
    for n=1:len,
        for o=1:r,
            for k=1:r,
                T(o,k)=X(n)^(o+k-2);
            end
        end
        S=S+T;
    end
    for n=1:r,  
        for o=1:len,
            F(n,1)=F(n,1)+(X(1,o)^(n-1)*Y(1,o));
        end
    end
    mx=inv(S)*F;
end
