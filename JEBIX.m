clear;
clc;
%wspolczynniki funkcji celu:
%w_Cel=[20 25 30];
%w_Cel=[100 150];
%w_Cel=[5 4];
w_Cel=[30 20 10];
i_P=size(w_Cel,2);
%macierz wspolczynników ograniczen
%w_Ogr=[10 20 15 900; 20 10 5 400; 10 5 10 300; 40 20 30 900 ];
%w_Ogr=[20 15 4000; 10 15 3000; 4 5 800 ];
%w_Ogr=[20 10 200; 10 10 100 ];
w_Ogr=[10 20 30 350; 30 5 10 420; 10 10 10 300; 60 50 20 1200 ];

i_Ogr=size(w_Ogr,1);
Ci=zeros(1,i_Ogr);
Cj=[w_Cel Ci];
Ai=(i_P+1):i_Ogr+i_P;
B=w_Ogr(:,end)';
opr=[w_Ogr(:,1:end-1) eye(i_Ogr)];
koniec=0;
iteracja=0;
while (koniec==0)
    iteracja=iteracja+1;
    tmpopr=opr;
    f=sum(Ci.*B);
    for i=1:size(opr,2),
        zj(i)=sum(Ci.*opr(:,i)');
    end
    deltaj=zj-Cj;
    if (sum(deltaj<0)>0)
        minD=minId(deltaj,0,opr);
        theta=B./opr(:,minD)';
        minT=minId(theta,minD,opr);
        disp(strcat('iteracja: ', num2str(iteracja)));
        num2str(tabela( Cj, Ci, Ai, B, tmpopr, theta, zj, f, deltaj, koniec ))
        Ai(minT)=minD;
        Ci(minT)=Cj(minD);
        d=opr(minT,minD);
        opr(minT,:)=opr(minT,:)/d;
        B(minT)=B(minT)/d;
        for i=1:i_Ogr,
           if (i~=minT)
              d=opr(i,minD);
              opr(i,:)=opr(i,:)-opr(minT,:).*d;
              B(i)=B(i)-B(minT).*d;
           end
        end
    else
        koniec=1;
        disp(strcat('iteracja: ', num2str(iteracja)));
        num2str(tabela( Cj, Ci, Ai, B, tmpopr, theta, zj, f, deltaj, koniec ))
    end

end


