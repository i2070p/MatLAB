function [ simplex ] = tabela( Cj, Ci, Ai, B, opr, theta, zj, f, deltaj, koniec )
p1=[zeros(3,2) [Ci; Ai; B]]';
p2=[Cj; 1:size(opr,2); opr];
p3=[zeros(1,2) f zj; zeros(1,3) deltaj];
if (koniec==1)
    simplex=[p1 p2;p3];
else
    p4=[zeros(2,1); theta'; zeros(2,1)];
    simplex=[[p1 p2;p3] p4];    
end

