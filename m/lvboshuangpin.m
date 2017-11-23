%????????
clc
tic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bbq=128/127;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
%????
del=100000;
% blank=imread('0.JPG');
imdata = imread('1.JPG');
II1=lkget_t(imdata,del,0,0);
imdata = imread('2.JPG');
II2=lkget_t(imdata,del,0,0);
imdata = imread('3.JPG');
II3=lkget_t(imdata,del,0,0);
imdata = imread('4.JPG');
II4=lkget_t(imdata,del,0,0);
imdata = imread('5.JPG');
III1=lkget_t(imdata,del,0,0);
imdata = imread('6.JPG');
III2=lkget_t(imdata,del,0,0);
imdata = imread('7.JPG');
III3=lkget_t(imdata,del,0,0);
imdata = imread('8.JPG'); 
III4=lkget_t(imdata,del,0,0);

imdata = imread('9.JPG');
w_II1=lkget_t(imdata,del,II1,1);
imdata = imread('10.JPG');
w_II2=lkget_t(imdata,del,II2,1);
imdata = imread('11.JPG');
w_II3=lkget_t(imdata,del,II3,1);
imdata = imread('12.JPG');
w_II4=lkget_t(imdata,del,II4,1);
imdata = imread('13.JPG');
w_III1=lkget_t(imdata,del,III1,1);
imdata = imread('14.JPG');
w_III2=lkget_t(imdata,del,III2,1);
imdata = imread('15.JPG');
w_III3=lkget_t(imdata,del,III3,1);
imdata = imread('16.JPG');
w_III4=lkget_t(imdata,del,III4,1);
%%   ????
  w=fspecial('average');%3x3(??)?????
  
  III1=imfilter(III1,w,'replicate');
  III2=imfilter(III2,w,'replicate');
  III3=imfilter(III3,w,'replicate');
  III4=imfilter(III4,w,'replicate');
  II1=imfilter(II1,w,'replicate');
  II2=imfilter(II2,w,'replicate');
  II3=imfilter(II3,w,'replicate');
  II4=imfilter(II4,w,'replicate');
  
  w_III1=imfilter(w_III1,w,'replicate');
  w_III2=imfilter(w_III2,w,'replicate');
  w_III3=imfilter(w_III3,w,'replicate');
  w_III4=imfilter(w_III4,w,'replicate');
  w_II1=imfilter(w_II1,w,'replicate');
  w_II2=imfilter(w_II2,w,'replicate');
  w_II3=imfilter(w_II3,w,'replicate');
  w_II4=imfilter(w_II4,w,'replicate');
%% 



%?????????
lk1=II1;
lk2=II2;
lk3=II3;
lk4=II4;
lk5=III1;
lk6=III2;
lk7=III3;
lk8=III4;

% II1=lvbo11(II1(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
% II2=lvbo11(II2(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
% II3=lvbo11(II3(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
% II4=lvbo11(II4(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
% 
% III1=lvbo11(III1(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
% III2=lvbo11(III2(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
% III3=lvbo11(III3(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
% III4=lvbo11(III4(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);




[xa,xb]=size(II1);
ss=100;
for i=1:xa
   for j=ss:xb-ss  
%????
%1???
    a12=II2(i,j)-II4(i,j);
    b12=II1(i,j)-II3(i,j);
        xhlp1=atan(a12/b12);
    if a12>0&&b12<0
        xhlp1=xhlp1+pi;
    elseif  a12<0&&b12<0
        xhlp1=xhlp1-pi;
    end    
%2???
    aa12=III2(i,j)-III4(i,j);
    bb12=III1(i,j)-III3(i,j);
        xhlp2=atan(aa12/bb12);
    if aa12>0&&bb12<0
        xhlp2=xhlp2+pi;
    elseif  aa12<0&&bb12<0
        xhlp2=xhlp2-pi;
    end    
%????    
    if xhlp2<0
        xhlp2=xhlp2+2*pi;
    end
    if xhlp1<0
        xhlp1=xhlp1+2*pi;
    end    
 %???2kpi+?    
     xhlq1(i,j-ss+1)=shape(xhlp1,xhlp2,bbq);  
  end  
end
%????
%???????????2pi???? ?????????? ???????? 2???
qq=unwrap(xhlq1',1.8*pi);
result_p=unwrap(qq',1.8*pi);
% [xa1,xb1]=size(result_w);

save('pingmian.mat','result_p');
%% 

%??????
%????
% II1=mixture(blank,II1,lk1);
% II2=mixture(blank,II2,lk2);
% II3=mixture(blank,II3,lk3);
% II4=mixture(blank,II4,lk4);
% III1=mixture(blank,III1,lk5);
% III2=mixture(blank,III2,lk6);
% III3=mixture(blank,III3,lk7);
% III4=mixture(blank,III4,lk8);

% w_II1=lvbo11(w_II1(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
% w_II2=lvbo11(w_II2(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
% w_II3=lvbo11(w_II3(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
% w_II4=lvbo11(w_II4(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
% 
% w_III1=lvbo11(w_III1(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
% w_III2=lvbo11(w_III2(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
% w_III3=lvbo11(w_III3(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);
% w_III4=lvbo11(w_III4(a_begin:a_end,b_begin:b_end),yz_begin,yz_end);



[xa,xb]=size(w_II1);
ss=100;
for i=1:xa
   for j=ss:xb-ss  
%????
%1???
    a12=w_II2(i,j)-w_II4(i,j);
    b12=w_II1(i,j)-w_II3(i,j);
        xhlp1=atan(a12/b12);
    if a12>0&&b12<0
        xhlp1=xhlp1+pi;
    elseif  a12<0&&b12<0
        xhlp1=xhlp1-pi;
    end    
%2???
    aa12=w_III2(i,j)-w_III4(i,j);
    bb12=w_III1(i,j)-w_III3(i,j);
        xhlp2=atan(aa12/bb12);
    if aa12>0&&bb12<0
        xhlp2=xhlp2+pi;
    elseif  aa12<0&&bb12<0
        xhlp2=xhlp2-pi;
    end    
%????    
    if xhlp2<0
        xhlp2=xhlp2+2*pi;
    end
    if xhlp1<0
        xhlp1=xhlp1+2*pi;
    end    
 %???2kpi+?    
     xhlq1(i,j-ss+1)=shape(xhlp1,xhlp2,bbq);  
  end  
end
%????
%???????????2pi???? ?????????? ????????
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
% colormap(gray);                            %??colormap( )??????????
%  shading interp;   
% light('Position',[-80,-262,-200],'style','infinite');   %??light( )???????????  
%  light('Position',[-500,-0,-4500],'style','infinite');
%  light('Position',[5000,100,-300],'style','infinite');
%  view(0,-90);  
%  lighting gouraud;   
colormap(gray);                            %??colormap( )??????????
shading interp;   
light('Position',[0,0,100],'style','infinite');   %??light( )???????????  
light('Position',[1000,0,100],'style','infinite');
light('Position',[400,400,100],'style','infinite');
view(90,90);                %???? ??? ???
lighting gouraud; 
toc