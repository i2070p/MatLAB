i_p=input('Podaj ilosc wezlow: ');
kx=zeros(1,i_p);
ky=zeros(1,i_p);

for n=1:i_p,
    kx(1,n)=input(strcat('Podaj x',int2str(n),': '));
    ky(1,n)=input(strcat('Podaj y',int2str(n),': '));
end

a=interpolacja(kx,ky);

i_w=length(a)

wxi=wartosciwielomianu(a,kx,ky);

hold on;

plot(dziedzina, wxi, kx, ky, 'r o')
title(string(etykieta(wx)));
