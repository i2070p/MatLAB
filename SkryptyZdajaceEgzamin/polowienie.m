function p = polowienie(f,a,b,imax)
iteracja=0;
if (f(a)*f(b))>0 
    disp('blad')
else
   while (iteracja<imax)%(abs(b-a)>0.001)
   disp(strcat('iteracja: ',int2str(iteracja+1)));
   disp(strcat(' a=',num2str(a),', b=',num2str(b)));
   iteracja=iteracja+1;
   p=(a+b)/2;
   disp(strcat(' p=',num2str(p)));
   if (f(a)*f(p)<0) 
       disp(' f(a) * f(p) < 0');
       disp(strcat('   ',num2str(f(a)),' * ',num2str(f(p)),' < 0'));
       b = p;
       disp(strcat(' b=',num2str(b)));
   else
       disp(' f(a) * f(p) > 0');
       disp(strcat('   ',num2str(f(a)),' * ',num2str(f(p)),' > 0'));
       a = p; 
       disp(strcat(' a=',num2str(a)));
   end
    %p = (a + b)/2;
    disp(strcat(' f(a)=',num2str(f(a)),', f(b)=',num2str(f(b))));  
   end
end
