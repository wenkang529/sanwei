function   a=myaverage(b,h,l)    %数组b  第几行h， 第几列l   算上b(h,l)的平均值
k=0;
jg=0;
c=b;
for n=0:30
if((l-n)>=1)
    jg=(jg+c(h,l-n));
    k=k+1; 
end
end 
a=jg/k;
