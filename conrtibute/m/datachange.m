% clc
% clear all
tic
% load('cc_60.mat');
xhlq=v3;
[h,l]=size(xhlq);
a=xhlq;

%叶片实际尺寸 4.5cm  推算出照片尺寸13.92cm
z=128;      %条纹周期数目
c=215;      %条纹总长度 
pix=3872;    %像素点总个数  （是相机的 不是投影仪的）2593*3872
s=53;        %相机到平面的距离
d=14.5;        %相机与投影仪之间的距离

t=c/z;      %光栅节距（即为在x轴上每变化一个周期 2*pi 对应的长度）
pixa=233/pix; %每个像素点的距离


for j=1:h
    for k=1:l
        cp(j,k)=s*a(j,k)/(2*pi*d/t+a(j,k));       
    end
end



for jj=1:h
    for kk=1:l
        m=l*(jj-1)+kk;
        aa(m,1)=jj*pixa;
        aa(m,2)=kk*pixa;
        aa(m,3)=cp(jj,kk);
    end
end

bb=aa';
savepcd('fname_-120.pcd', bb);
% 
% 
cc=bb(:,1:5:end);
savepcd('fname1_-120.pcd', cc);

toc


