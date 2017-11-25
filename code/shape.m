function [m,n]=shape(fai1,fai2,k)

if fai2-k*fai1<=0
m=round((fai2-k*fai1)/(k-1)/2/pi);  %四舍五入取整
else 
m=round((fai2-k*fai1-2*pi)/(k-1)/2/pi);
end
n=m;
m=fai1+m*2*pi;