%struktury danych - LAB1

i_w=input('Podawaj do ilosc wspolczynnikow wielomianu: ');

wx=zeros(1,i_w);

for i=1:i_w,
    wx(1,i)=input('podaj wspolczynnik: ');
end

dziedzina = -20:0.1:20;
wxi=zeros(1,length(dziedzina));
for i=1:length(dziedzina),
    ix = dziedzina(i);  
    for j=1:i_w,
        wxi(1,i)=wx(j)*ix^(j-1);
    end 
end


str='w(x)=';

if (i_w>=2)
for i=i_w:-1:2,
    wi=wx(1,i);
    if (wi<0), str = strcat(str, '-', int2str(abs(wi)),'*x^',int2str(i-1));
    else str = strcat(str,'+',int2str(wi),'*x^',int2str(i-1));
    end;
end 
end 
if (wx(1,1)<0),
str = strcat(str,'-',int2str(abs(wx(1,1))));
else str = strcat(str,'+',int2str(wx(1,1)));
end
hold on;



plot(dziedzina, wxi)
title(string(str));
