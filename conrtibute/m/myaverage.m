function   a=myaverage(b,h,l)    %����b  �ڼ���h�� �ڼ���l   ����b(h,l)��ƽ��ֵ
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
