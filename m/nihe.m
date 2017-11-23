function result=nihe(value,num)
%nihe ?????value????????num?????
v1=value;
[h,l]=size(v1);
for i2=1:h
x=1:1:l;
v2=v1(i2,:);
a=polyfit(x,v2,num);
y=polyval(a,x);
result1(i2,:)=y;
end
result=result1;