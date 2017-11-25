function  result=lie_err(sw1,fz,fz1)
sw_z=sw1';
[h,l]=size(sw_z);
for i3=1:h   
h1=sw_z(i3,:);
for ii=1:5
h1=err_p0(h1,fz,fz1);
end

for i1=1:l-2
   ave1=myaverage(h1,i2,i1);
if ( abs(ave1-h1(i2,i1+1))>fz)
h1(i2,i1+1)=err_p1(h1(i2,i1+1),ave1,fz1); 
end
end
sw_z(i3,:)=h1;
end

result=sw_z;
