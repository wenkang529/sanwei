load('phase_or')

h1=phase;
[h,l]=size(h1);

fz=1.5*pi;
fz1=0.5*pi;

fz2=1.5*pi;
fz3=0.5*pi;
   
for i2=1:h-1
for i1=1:l-1
    a1=h1(i2,i1+1); 
    m2=myaverage(h1,i2,i1);
    
% if ( abs(h1(i2,i1)-h1(i2,i1+1))>fz)
  if ( abs(m2-h1(i2,i1+1))>fz) 
    if(abs((a1-pi)-h1(i2,i1)) < fz1)
    a2=a1-pi;
    end   
    if(abs((a1+pi)-h1(i2,i1)) < fz1)
    a2=a1+pi;
    end   
    if(abs((a1+2*pi)-h1(i2,i1)) < fz1)
    a2=a1+2*pi;
    end      
    if(abs((a1-2*pi)-h1(i2,i1)) < fz1)
    a2=a1-2*pi;
    end
    h1(i2,i1+1)=a2;
  end
end
end
mydisplay(h1)
