% clc
% clear all
tic
% load('cc_60.mat');
xhlq=v3;
[h,l]=size(xhlq);
a=xhlq;

%ҶƬʵ�ʳߴ� 4.5cm  �������Ƭ�ߴ�13.92cm
z=128;      %����������Ŀ
c=215;      %�����ܳ��� 
pix=3872;    %���ص��ܸ���  ��������� ����ͶӰ�ǵģ�2593*3872
s=53;        %�����ƽ��ľ���
d=14.5;        %�����ͶӰ��֮��ľ���

t=c/z;      %��դ�ھࣨ��Ϊ��x����ÿ�仯һ������ 2*pi ��Ӧ�ĳ��ȣ�
pixa=233/pix; %ÿ�����ص�ľ���


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


