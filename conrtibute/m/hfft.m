aa=xhlq(:,10);

yz_1=300;
yz_2=300;

[h1,l1]=size(aa);
A11=fft2(aa,h1,l1);
A11=fftshift(A11);
ww=real(A11);
plot(ww); %��ʾƵ��

%��ͨ�˲�
H11=ones(h1,l1);
H11(:,yz_1:yz_2)=0;
result11=A11.*H11;   %��ӦԪ�����
result11=ifftshift(result11);
X21=ifft2(result11);
X31=(real(X21));     %ȡʵ��

%�����˲�
% H11=zeros(h1,l1);
% H11(:,yz_1:yz_2)=1;
% result11=A11.*H11;   %��ӦԪ�����
% result11=ifftshift(result11);
% X21=ifft2(result11);
% X31=(real(X21));     %ȡʵ��

figure
plot(aa);     %��ʾԭͼ
hold on
plot(X31,'r')  %��ʾ�˲����ʱ��ͼ