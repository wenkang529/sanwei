%??????
% load('xhlq1.mat');
a=xhlq;
b=nihe(a,20);

xiao22=b;
surf(-xiao22)
colormap(gray);                            %??colormap( )??????????
shading interp;                            %????
light('Position',[0,0,100],'style','infinite');   %??light( )???????????
light('Position',[1000,0,100],'style','infinite');
light('Position',[400,400,100],'style','infinite');
view(-90,90);                                    %????
lighting gouraud; 