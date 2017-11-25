clc
tic
bbq=128/127;
%% 
%平面处理
blank=imread('0.JPG');
imdata = imread('1.JPG');
II1=(rgb2gray(imdata));
imdata = imread('2.JPG');
II2=(rgb2gray(imdata)); 
imdata = imread('3.JPG');
II3=(rgb2gray(imdata));
imdata = imread('4.JPG');
II4=(rgb2gray(imdata));
imdata = imread('5.JPG');
III1=(rgb2gray(imdata));
imdata = imread('6.JPG');
III2=(rgb2gray(imdata));
imdata = imread('7.JPG');
III3=(rgb2gray(imdata));
imdata = imread('8.JPG'); 
III4=(rgb2gray(imdata));

%保存为提取轮廓使用
lk1=II1;
lk2=II2;
lk3=II3;
lk4=II4;
lk5=III1;
lk6=III2;
lk7=III3;
lk8=III4;


II1=lvbo11(II1(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
II2=lvbo11(II2(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
II3=lvbo11(II3(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
II4=lvbo11(II4(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);

III1=lvbo11(III1(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
III2=lvbo11(III2(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
III3=lvbo11(III3(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
III4=lvbo11(III4(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);




[xa,xb]=size(II1);
ss=100;
for i=1:xa
   for j=ss:xb-ss  
%相位求解
%1根条纹
    a12=II2(i,j)-II4(i,j);
    b12=II1(i,j)-II3(i,j);
        xhlp1=atan(a12/b12);
    if a12>0&&b12<0
        xhlp1=xhlp1+pi;
    elseif  a12<0&&b12<0
        xhlp1=xhlp1-pi;
    end    
%2根条纹
    aa12=III2(i,j)-III4(i,j);
    bb12=III1(i,j)-III3(i,j);
        xhlp2=atan(aa12/bb12);
    if aa12>0&&bb12<0
        xhlp2=xhlp2+pi;
    elseif  aa12<0&&bb12<0
        xhlp2=xhlp2-pi;
    end    
%消除负轴    
    if xhlp2<0
        xhlp2=xhlp2+2*pi;
    end
    if xhlp1<0
        xhlp1=xhlp1+2*pi;
    end    
 %解出来2kpi+θ    
     xhlq1(i,j-ss+1)=shape(xhlp1,xhlp2,bbq);  
  end  
end
%跳变处理
%相位跳变大于阈值的加减2pi的整数倍 使其跳变小于某个阈值 默认按列方向运行 2表示列
qq=unwrap(xhlq1',1.8*pi);
result_p=unwrap(qq',1.8*pi);
% [xa1,xb1]=size(result_w);

save('pingmian.mat','result_p');
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
%物体处理程序
imdata = imread('9.JPG');
II1=(rgb2gray(imdata));
imdata = imread('10.JPG');
II2=(rgb2gray(imdata));
imdata = imread('11.JPG');
II3=(rgb2gray(imdata));
imdata = imread('12.JPG');
II4=(rgb2gray(imdata));


imdata = imread('13.JPG');
III1=(rgb2gray(imdata));
imdata = imread('14.JPG');
III2=(rgb2gray(imdata));
imdata = imread('15.JPG');
III3=(rgb2gray(imdata));
imdata = imread('16.JPG');
III4=(rgb2gray(imdata));

%提取轮廓
II1=mixture(blank,II1,lk1);
II2=mixture(blank,II2,lk2);
II3=mixture(blank,II3,lk3);
II4=mixture(blank,II4,lk4);
III1=mixture(blank,III1,lk5);
III2=mixture(blank,III2,lk6);
III3=mixture(blank,III3,lk7);
III4=mixture(blank,III4,lk8);

II1=lvbo11(II1(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
II2=lvbo11(II2(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
II3=lvbo11(II3(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
II4=lvbo11(II4(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);

III1=lvbo11(III1(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
III2=lvbo11(III2(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
III3=lvbo11(III3(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
III4=lvbo11(III4(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);



[xa,xb]=size(II1);
ss=100;
for i=1:xa
   for j=ss:xb-ss  
%相位求解
%1根条纹
    a12=II2(i,j)-II4(i,j);
    b12=II1(i,j)-II3(i,j);
        xhlp1=atan(a12/b12);
    if a12>0&&b12<0
        xhlp1=xhlp1+pi;
    elseif  a12<0&&b12<0
        xhlp1=xhlp1-pi;
    end    
%2根条纹
    aa12=III2(i,j)-III4(i,j);
    bb12=III1(i,j)-III3(i,j);
        xhlp2=atan(aa12/bb12);
    if aa12>0&&bb12<0
        xhlp2=xhlp2+pi;
    elseif  aa12<0&&bb12<0
        xhlp2=xhlp2-pi;
    end    
%消除负轴    
    if xhlp2<0
        xhlp2=xhlp2+2*pi;
    end
    if xhlp1<0
        xhlp1=xhlp1+2*pi;
    end    
 %解出来2kpi+θ    
     xhlq1(i,j-ss+1)=shape(xhlp1,xhlp2,bbq);  
  end  
end
%跳变处理
%相位跳变大于阈值的加减2pi的整数倍 使其跳变小于某个阈值 默认按列方向运行
hzz=round(xa/2);
jiequ_down=xhlq1(hzz+1:xa,:);
for jiequ1=1:hzz
jiequ_upo(jiequ1,:)=xhlq1(hzz-jiequ1+1,:);
end
qq=unwrap(jiequ_down',1.8*pi);
result_down=unwrap(qq',1.8*pi);
qq=unwrap(jiequ_upo',1.8*pi);
result_up=unwrap(qq',1.8*pi);

for jiequ2=1:hzz
result_up1(jiequ2,:)=result_up(hzz-jiequ2+1,:);
end
result_y=result_up1;
for jiequ3=1:(xa-hzz)
    result_y(jiequ3+hzz,:)=result_down(jiequ3,:);
end
result_w=result_y;
% qq=unwrap(xhlq1',1.8*pi);
% result_y=unwrap(qq',1.8*pi);
[xa1,xb1]=size(result_w);
save('wuti.mat','result_w')
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pp=result_p-result_w; 
xhlq=pp;
for i=3:xa1-3
  for j=3:xb1-3
      dl=pi/2;
      
      p1=abs(xhlq(i,j)-xhlq(i-1,j))>=dl;
      p2=abs(xhlq(i-1,j)-xhlq(i+1,j))>=dl;
      p3=abs(xhlq(i-1,j)-xhlq(i+2,j))>=2*dl;
      q1=abs(xhlq(i,j)-xhlq(i,j-1))>=dl;
      q2=abs(xhlq(i,j+1)-xhlq(i,j-1))>=dl;
      q3=abs(xhlq(i,j+2)-xhlq(i,j-1))>=2*dl;
      if p1&&~p2
          xhlq(i,j)=(xhlq(i-1,j)+xhlq(i+1,j))/2;
      elseif q1&&~q2
          xhlq(i,j)=(xhlq(i,j-1)+xhlq(i,j+1))/2;
      elseif p1&&~p3
                   xhlq(i,j)=(xhlq(i+2,j)+xhlq(i-1,j))/2;
                   xhlq(i+1,j)=(xhlq(i,j)+xhlq(i+2,j))/2;
      elseif   q1&&~q3
          xhlq(i,j)=(xhlq(i,j-1)+xhlq(i,j+2))/2;
          xhlq(i,j+1)=(xhlq(i,j)+xhlq(i,j+2))/2;
      end
  end
end

save('xhlq.mat','xhlq')

figure;
surf(-xhlq)
% colormap(gray);                            %利用colormap( )函数为图像定义颜色集
%  shading interp;   
% light('Position',[-80,-262,-200],'style','infinite');   %利用light( )函数为图像设置光照效果  
%  light('Position',[-500,-0,-4500],'style','infinite');
%  light('Position',[5000,100,-300],'style','infinite');
%  view(0,-90);  
%  lighting gouraud;   
colormap(gray);                            %利用colormap( )函数为图像定义颜色集
shading interp;   
light('Position',[0,0,100],'style','infinite');   %利用light( )函数为图像设置光照效果  
light('Position',[1000,0,100],'style','infinite');
light('Position',[400,400,100],'style','infinite');
view(90,90);                %视点控制 方位角 俯视角
lighting gouraud; 
toc