function [ H ] = histogram(obraz, n )
p=uint8((255/n));

if (n~=1) 

    
    k=n;
    if (n==255) 
        k=n+1;
    end
    przedzialy=zeros(k,3);
    przedzialy(1,1)=0;  
    przedzialy(1,2)=p-1;
    for i=2:k,
        przedzialy(i,1)=przedzialy(i-1,1)+p; 
        przedzialy(i,2)=przedzialy(i-1,2)+p; 
    end
    przedzialy(end,2)=255;
    
   for i=1:size(obraz,1),
   for j=1:size(obraz,2),
       for k=1:size(przedzialy,1);
        if (obraz(i,j)>=przedzialy(k,1) && obraz(i,j)<=przedzialy(k,2)) 
           przedzialy(k,3)=przedzialy(k,3)+1;
        end
       end
   end
   
   bar(przedzialy(:,2),przedzialy(:,3));
end
    
else 
    przedzialy(1,1)=0;
    przedzialy(1,2)=p;
end

xmin=0;
for i=0:255,
    if (przedzialy(i+1,3)>0) 
       xmin=i+1;
       break; 
    end
end
xmax=0;
for i=255:-1:0,
    if (przedzialy(i+1,3)>0) 
       xmax=i+1;
       break; 
    end
end
a=3/(xmax-xmin);
%(x(i,j)-Xmin)/(Xmax-Xmin)*255 -- wzor
end

