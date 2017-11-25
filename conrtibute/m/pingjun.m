clc
load('xhlq.mat')
[h,l]=size(xhlq);
a=xhlq;
t=0.5;

for m=1:h
    for n=1:l
        if((m>1)&&(m<h)&&(n>1)&&(n<l))
            a1=a(m,n+1)+a(m,n-1)+a(m+1,n)+a(m-1,n)+a(m-1,n-1)+a(m-1,n+1)+a(m+1,n+1)+a(m-1,n+1)+a(m,n);
            a1=a1/9;
            if((a1-a(m,n))<t)
                a(m,n)=a1;
            end
        end        
    end
end

figure;
surf(-a)
colormap(gray);                            %利用colormap( )函数为图像定义颜色集
shading interp;   
light('Position',[0,0,100],'style','infinite');   %利用light( )函数为图像设置光照效果  
light('Position',[1000,0,100],'style','infinite');
light('Position',[400,400,100],'style','infinite');
view(90,90);                %视点控制 方位角 俯视角
lighting gouraud; 