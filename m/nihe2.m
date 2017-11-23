%????????? ???? ??????
clc
nihecishu=8;
load('pingmian.mat');
load('wuti.mat');
[h,l]=size(result_p);
for i2=1:h
pm=result_p(i2,:);
wt=result_w(i2,:);
x=1:1:l;
y=pm;
a=polyfit(x,y,1);
y=polyval(a,x);

x1=1:1:l;
y2=wt;
b=polyfit(x1,y2,8);
y1=polyval(b,x1);

re=y-y1;
result1(i2,:)=re;
end

resulta=result1;
for i=3:h-3
  for j=3:l-3
      dl=pi/2;
      
      p1=abs(resulta(i,j)-resulta(i-1,j))>=dl;
      p2=abs(resulta(i-1,j)-resulta(i+1,j))>=dl;
      p3=abs(resulta(i-1,j)-resulta(i+2,j))>=2*dl;
      q1=abs(resulta(i,j)-resulta(i,j-1))>=dl;
      q2=abs(resulta(i,j+1)-resulta(i,j-1))>=dl;
      q3=abs(resulta(i,j+2)-resulta(i,j-1))>=2*dl;
      if p1&&~p2
          resulta(i,j)=(resulta(i-1,j)+resulta(i+1,j))/2;
      elseif q1&&~q2
          resulta(i,j)=(resulta(i,j-1)+resulta(i,j+1))/2;
      elseif p1&&~p3
                   resulta(i,j)=(resulta(i+2,j)+resulta(i-1,j))/2;
                   resulta(i+1,j)=(resulta(i,j)+resulta(i+2,j))/2;
      elseif   q1&&~q3
          resulta(i,j)=(resulta(i,j-1)+resulta(i,j+2))/2;
          resulta(i,j+1)=(resulta(i,j)+resulta(i,j+2))/2;
      end
  end
end

figure;
surf(-resulta)
colormap(gray);                            %??colormap( )??????????
shading interp;   
light('Position',[0,0,100],'style','infinite');   %??light( )???????????  
light('Position',[1000,0,100],'style','infinite');
light('Position',[400,400,100],'style','infinite');
view(90,90);                %???? ??? ???
lighting gouraud; 