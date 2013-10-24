i_p=input('Podaj ilosc wezlow: ');
i_r=input('Podaj stopien wielomianu aproksymaujacego: ');
kx=zeros(1,i_p);
ky=zeros(1,i_p);

for n=1:i_p,
    kx(1,n)=input(strcat('Podaj x',int2str(n),': '));
    ky(1,n)=input(strcat('Podaj y',int2str(n),': '));
end

%i_p=8;
%kx=[1 4 5 7 12 15 17 ];
%ky=[9 8 -5 8 0 -2 11 ];
%i_r=3;

aa=aproksymacja(kx,ky,i_r);
ai=interpolacja(kx,ky);

dziedzina = (kx(1,1)-1):0.1:(kx(1,end)+1);
wxi_a=wartosciwielomianu(aa,kx,ky,dziedzina);
wxi_i=wartosciwielomianu(ai,kx,ky,dziedzina);
hold on;

plot(dziedzina, wxi_a, dziedzina, wxi_i, 'cyan', kx, ky, 'r o');
title(string(etykieta(wx)));
