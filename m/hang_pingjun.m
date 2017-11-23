clc
load('xhlq.mat')

a=xhlq';
[h,l]=size(a);

b=a;
t=0.5;

for m=1:h
    for n=10:l-10
        a1=b(m,n+1)+b(m,n+2)+b(m,n+3)+b(m,n+4)+b(m,n+5)+b(m,n-1)+b(m,n-2)+b(m,n-3)+b(m,n-4)+b(m,n-5)+b(m,n);
        b(m,n)=a1/11;
    end
end
a=b;

figure;
surf(-a)
colormap(gray);                            %??colormap( )??????????
shading interp;   
light('Position',[0,0,100],'style','infinite');   %??light( )???????????  
light('Position',[1000,0,100],'style','infinite');
light('Position',[400,400,100],'style','infinite');
view(90,90);                %???? ??? ???
lighting gouraud; 