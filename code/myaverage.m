function   a=myaverage(b,h,l)
%calculate the average of line
% b:matrix h:line axis l:column axis
k=0;
re1=0;
for n=0:29
if((l-n)>=1)
    re1=(re1+b(h,l-n));
    k=k+1; 
end
end 
a=re1/k;
