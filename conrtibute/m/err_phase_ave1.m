clc
load('xhlq.mat');

h1=xhlq';
[h,l]=size(h1);


fz=1.5*pi;
fz1=0.5*pi;    
   
for i2=1:h
for i1=1:(l-1)
    a1=h1(i2,i1+1);
    m2=myaverage(h1,i2,i1);
%     m2=h1(i2,i1);
    if (abs(m2-a1)>fz)
        h1(i2,i1+1)=err_p1(h1(i2,i1+1),m2,fz1);
    end
end
end

xiao22=h1;
my11=xiao22;
surf(-xiao22)
colormap(gray);                            %����colormap( )����Ϊͼ������ɫ��
shading interp;                            %������ɫ
light('Position',[0,0,100],'style','infinite');   %����light( )����Ϊͼ�����ù���Ч��
light('Position',[1000,0,100],'style','infinite');
light('Position',[400,400,100],'style','infinite');
view(-90,90);                                    %�ӵ㴦��
lighting gouraud; 