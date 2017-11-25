clear all
clc
tic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bbq=128/127;

h_begin=800;
h_end=1500; 
l_begin=2450;
l_end=3300;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
del=1000;
imdata = imread('0.JPG');% 读取图像
imdata=rgb2gray(imdata);
imdata=imdata(h_begin:h_end,l_begin:l_end);
level=graythresh(imdata);     %确定灰度阈值
bw=im2bw(imdata,level);
dw = bwareaopen(bw,del);  %删除不相关点
result_lk = uint8(dw);
%% 
%平面处理
del=100000;
% blank=imread('0.JPG');
imdata = imread('1.JPG');
II1=pic_deal(result_lk,h_begin,h_end,l_begin,l_end,imdata,0,0);
imdata = imread('2.JPG');
II2=pic_deal(result_lk,h_begin,h_end,l_begin,l_end,imdata,0,0);
imdata = imread('3.JPG');
II3=pic_deal(result_lk,h_begin,h_end,l_begin,l_end,imdata,0,0);
imdata = imread('4.JPG');
II4=pic_deal(result_lk,h_begin,h_end,l_begin,l_end,imdata,0,0);
imdata = imread('5.JPG');
III1=pic_deal(result_lk,h_begin,h_end,l_begin,l_end,imdata,0,0);
imdata = imread('6.JPG');
III2=pic_deal(result_lk,h_begin,h_end,l_begin,l_end,imdata,0,0);
imdata = imread('7.JPG');
III3=pic_deal(result_lk,h_begin,h_end,l_begin,l_end,imdata,0,0);
imdata = imread('8.JPG'); 
III4=pic_deal(result_lk,h_begin,h_end,l_begin,l_end,imdata,0,0);

imdata = imread('9.JPG');
w_II1=pic_deal(result_lk,h_begin,h_end,l_begin,l_end,imdata,II1,1);
imdata = imread('10.JPG');
w_II2=pic_deal(result_lk,h_begin,h_end,l_begin,l_end,imdata,II2,1);
imdata = imread('11.JPG');
w_II3=pic_deal(result_lk,h_begin,h_end,l_begin,l_end,imdata,II3,1);
imdata = imread('12.JPG');
w_II4=pic_deal(result_lk,h_begin,h_end,l_begin,l_end,imdata,II4,1);
imdata = imread('13.JPG');
w_III1=pic_deal(result_lk,h_begin,h_end,l_begin,l_end,imdata,III1,1);
imdata = imread('14.JPG');
w_III2=pic_deal(result_lk,h_begin,h_end,l_begin,l_end,imdata,III2,1);
imdata = imread('15.JPG');
w_III3=pic_deal(result_lk,h_begin,h_end,l_begin,l_end,imdata,III3,1);
imdata = imread('16.JPG');
w_III4=pic_deal(result_lk,h_begin,h_end,l_begin,l_end,imdata,III4,1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[xa,xb]=size(II1);
ss=100;
for i=1:xa
   for j=1:xb  
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
     xhlq1(i,j)=shape(xhlp1,xhlp2,bbq);  
  end  
end
%跳变处理
%相位跳变大于阈值的加减2pi的整数倍 使其跳变小于某个阈值 默认按列方向运行 2表示列
qq=unwrap(xhlq1',1.8*pi);
result_p=unwrap(qq',1.8*pi);
save('pingmian.mat','result_p');
%% 
%;处理物体
[xa,xb]=size(w_II1);
for i=1:xa
   for j=1:xb  
%相位求解
%1根条纹
    a12=w_II2(i,j)-w_II4(i,j);
    b12=w_II1(i,j)-w_II3(i,j);
        xhlp1=atan(a12/b12);
    if a12>0&&b12<0
        xhlp1=xhlp1+pi;
    elseif  a12<0&&b12<0
        xhlp1=xhlp1-pi;
    end    
%2根条纹
    aa12=w_III2(i,j)-w_III4(i,j);
    bb12=w_III1(i,j)-w_III3(i,j);
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
     xhlq1(i,j)=shape(xhlp1,xhlp2,bbq);  
  end  
end
%跳变处理
%相位跳变大于阈值的加减2pi的整数倍 使其跳变小于某个阈值 默认按列方向运行
hzz=round(xa/2);
jiequ_down=xhlq1(hzz:xa,:);
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
    result_y(jiequ3+hzz,:)=result_down(jiequ3+1,:);
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
aa=logical(result_lk);
bb=aa.*xhlq;
cc= err_p0(bb,0.5*pi,pi);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

save('xhlq.mat','xhlq')
save('cc_.mat','cc')
figure;
surf(-cc)
colormap(gray);                            %利用colormap( )函数为图像定义颜色集
shading interp;   
light('Position',[0,0,100],'style','infinite');   %利用light( )函数为图像设置光照效果  
light('Position',[1000,0,100],'style','infinite');
light('Position',[400,400,100],'style','infinite');
view(90,90);                %视点控制 方位角 俯视角
lighting gouraud; 
toc