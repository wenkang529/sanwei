%????
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
colormap(gray);                            %??colormap( )??????????
shading interp;   
light('Position',[0,0,100],'style','infinite');   %??light( )???????????  
light('Position',[1000,0,100],'style','infinite');
light('Position',[400,400,100],'style','infinite');
view(90,90);                %???? ??? ???
lighting gouraud; 