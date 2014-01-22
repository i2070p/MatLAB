function x0 = falsi_2(f,a,b,imax)
iteracja=0;
eps=0.001;
fa=f(a);
fb=f(b);
x1=a;
x0=b;
if (fa*fb>0) 
    disp('blad')
else
   
   while (iteracja<imax)%(abs(x1-x0)>eps)
   disp(strcat('iteracja: ',int2str(iteracja+1)));
   disp(strcat(' a=',num2str(a),', b=',num2str(b)));
   disp(strcat(' x0=',num2str(x0),' x1=',num2str(x1)));
   disp(strcat(' f(a)=',num2str(f(a)),', f(b)=',num2str(f(b))));
   x1=x0;
   disp(strcat(' x1=x0=',num2str(x0)));
   x0=a-fa*(b-a)/(fb-fa);
   disp(strcat(' x0=a-f(a)*(b-a)/(f(b)-f(a))=',num2str(x0)));
   f0=f(x0);
   disp(strcat(' f(x0)=',num2str(f(x0))));

   if (abs(f0)<eps) 
       break; 
   end
   
   if (fa*f0<0) 
       disp(' f(a) * f(x0) < 0');
       disp(strcat('   ',num2str(f(a)),' * ',num2str(f0),' < 0'));
       b = x0;
       fb = f0;
       disp(strcat(' b=',num2str(b),' f(b)=',num2str(f0)));
   else
       disp(' f(a) * f(x0) > 0');
       disp(strcat('   ',num2str(f(a)),' * ',num2str(f0),' > 0'));
       a = x0;
       fa = f0;
       disp(strcat(' a=',num2str(a),' f(a)=',num2str(f0)));
   end
   iteracja=iteracja+1;
    %p = (a + b)/2;
   end
end
