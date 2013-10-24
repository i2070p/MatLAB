function mx =etykieta(w_x);
    str='w(x)=';
    i_w=length(w_x);
    if (i_w>=2)
        for i=i_w:-1:2,
            wi=w_x(1,i);
            if (wi<0), str = strcat(str, '-', int2str(abs(wi)),'*x^',int2str(i-1));
            else str = strcat(str,'+',int2str(wi),'*x^',int2str(i-1));
            end;
        end
    end
    if (w_x(1,1)<0), str = strcat(str,'-',int2str(abs(w_x(1,1))));
    else str = strcat(str,'+',int2str(w_x(1,1)));
    end
    mx=str;
end
