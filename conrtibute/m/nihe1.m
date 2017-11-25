%拟合最后结果
% load('xhlq1.mat');
a=xhlq;
b=nihe(a,20);

xiao22=b;
surf(-xiao22)
colormap(gray);                            %利用colormap( )函数为图像定义颜色集
shading interp;                            %设置颜色
light('Position',[0,0,100],'style','infinite');   %利用light( )函数为图像设置光照效果
light('Position',[1000,0,100],'style','infinite');
light('Position',[400,400,100],'style','infinite');
view(-90,90);                                    %视点处理
lighting gouraud; 