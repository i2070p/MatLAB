i_p=input('Podaj ilosc wezlow: ');
kx=zeros(1,i_p);
ky=zeros(1,i_p);

for n=1:i_p,
    kx(1,n)=input(strcat('Podaj x',int2str(n),': '));
    ky(1,n)=input(strcat('Podaj y',int2str(n),': '));
end

v=zeros(i_p);
for n=1:i_p,
    for o=1:i_p,
        v(n,o)=kx(1,n)^(o-1);
    end
end

a=(inv(v)*ky')'

i_w=length(a)

wx=a;

dziedzina = (kx(1,1)-1):0.1:(kx(1,end)+1);
wxi=zeros(1,length(dziedzina));
for i=1:length(dziedzina),
    ix = dziedzina(i);
    for j=1:i_w,
        wxi(1,i)=wxi(1,i)+wx(j)*ix^(j-1);
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

plot(dziedzina, wxi, kx, ky, 'r x')
title(string(str));
