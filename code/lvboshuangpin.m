tic
close all

%number of stripes
bbq=128/127;

% read picture
imdata = imread('1.JPG');
II1=double(rgb2gray(imdata));
imdata = imread('2.JPG');
II2=double(rgb2gray(imdata));
imdata = imread('3.JPG');
II3=double(rgb2gray(imdata));
imdata = imread('4.JPG');
II4=double(rgb2gray(imdata));
imdata = imread('5.JPG');
III1=double(rgb2gray(imdata));
imdata = imread('6.JPG');
III2=double(rgb2gray(imdata));
imdata = imread('7.JPG');
III3=double(rgb2gray(imdata));
imdata = imread('8.JPG');
III4=double(rgb2gray(imdata));

%filter
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
%phase solution
%127
    a12=II2(i,j)-II4(i,j);
    b12=II1(i,j)-II3(i,j);
        r1=atan(a12/b12);
    if a12>0&&b12<0
        r1=r1+pi;
    elseif  a12<0&&b12<0
        r1=r1-pi;
    end    
%128
    aa12=III2(i,j)-III4(i,j);
    bb12=III1(i,j)-III3(i,j);
        r2=atan(aa12/bb12);
    if aa12>0&&bb12<0
        r2=r2+pi;
    elseif  aa12<0&&bb12<0
        r2=r2-pi;
    end    
%eliminate the negative axis   
    if r2<0
        r2=r2+2*pi;
    end
    if r1<0
        r1=r1+2*pi;
    end    
 %solve the phase 2*K*pi+?
     re1(i,j-ss+1)=shape(r1,r2,bbq);  
  end  
end
%solve the phase jump
p1=unwrap(re1',1.8*pi);
result_p=unwrap(p1',1.8*pi);

save('pingmian.mat','result_p')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calculate the object

imdata = imread('9.JPG');
II1=double(rgb2gray(imdata));
imdata = imread('10.JPG');
II2=double(rgb2gray(imdata));
imdata = imread('11.JPG');
II3=double(rgb2gray(imdata));
imdata = imread('12.JPG');
II4=double(rgb2gray(imdata));
imdata = imread('13.JPG');
III1=double(rgb2gray(imdata));
imdata = imread('14.JPG');
III2=double(rgb2gray(imdata));
imdata = imread('15.JPG');
III3=double(rgb2gray(imdata));
imdata = imread('16.JPG');
III4=double(rgb2gray(imdata));


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
%solve the phase
%127
    a12=II2(i,j)-II4(i,j);
    b12=II1(i,j)-II3(i,j);
        r1=atan(a12/b12);
    if a12>0&&b12<0
        r1=r1+pi;
    elseif  a12<0&&b12<0
        r1=r1-pi;
    end    
%128
    aa12=III2(i,j)-III4(i,j);
    bb12=III1(i,j)-III3(i,j);
        r2=atan(aa12/bb12);
    if aa12>0&&bb12<0
        r2=r2+pi;
    elseif  aa12<0&&bb12<0
        r2=r2-pi;
    end    
%solve the negative axis 
    if r2<0
        r2=r2+2*pi;
    end
    if r1<0
        r1=r1+2*pi;
    end    
 %solve the phase 2*K*pi+?
     re1(i,j-ss+1)=shape(r1,r2,bbq);  
  end  
end
%solve the phase adjump
p2=unwrap(re1',1.8*pi);
result_w=unwrap(p2',1.8*pi);
[xa1,xb1]=size(result_w);
save('wuti.mat','result_w')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

phase1=result_w-result_p; 
for i=3:xa1-3
  for j=3:xb1-3
      dl=pi/2;
      
      p_1=abs(phase1(i,j)-phase1(i-1,j))>=dl;
      p_2=abs(phase1(i-1,j)-phase1(i+1,j))>=dl;
      p_3=abs(phase1(i-1,j)-phase1(i+2,j))>=2*dl;
      q_1=abs(phase1(i,j)-phase1(i,j-1))>=dl;
      q_2=abs(phase1(i,j+1)-phase1(i,j-1))>=dl;
      q_3=abs(phase1(i,j+2)-phase1(i,j-1))>=2*dl;
      if p_1&&~p_2
          phase1(i,j)=(phase1(i-1,j)+phase1(i+1,j))/2;
      elseif q_1&&~q_2
          phase1(i,j)=(phase1(i,j-1)+phase1(i,j+1))/2;
      elseif p_1&&~p_3
                   phase1(i,j)=(phase1(i+2,j)+phase1(i-1,j))/2;
                   phase1(i+1,j)=(phase1(i,j)+phase1(i+2,j))/2;
      elseif q_1&&~q_3
          phase1(i,j)=(phase1(i,j-1)+phase1(i,j+2))/2;
          phase1(i,j+1)=(phase1(i,j)+phase1(i,j+2))/2;
      end
  end
end
phase=-phase1;
save('phase_or.mat','phase')

figure('name','result');
surf(phase)
colormap(gray);                            %define a color set
shading interp;      
light('Position',[0,0,-100],'style','infinite');   %add light and shadow effect
light('Position',[1000,0,100],'style','infinite');
light('Position',[400,400,100],'style','infinite');
view(90,-90);                %set the perspective
lighting flat; 
toc