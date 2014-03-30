function [ min ] = minId( tab, minD, opr )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
min=1;

if (minD>0)
    for i=1:size(tab,2),
        if (tab(i)<tab(min))
             if (tab(i)>0)
            min=i;
             else
                 if (tab(i)==0)
                     if (opr(i,minD)>=0)
                      min=i;   
                     end
                 end
             end
        else
            %if (tab(i)==tab(min))
             %  if (opr(i,minD)>opr(min,minD))
              %      min=i;
               % end
            %end
        end
    end
else
   for i=1:size(tab,2),
        if (tab(i)<tab(min))
          min=i;   
        end
    end    
end




end

