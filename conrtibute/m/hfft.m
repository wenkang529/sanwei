aa=xhlq(:,10);

yz_1=300;
yz_2=300;

[h1,l1]=size(aa);
A11=fft2(aa,h1,l1);
A11=fftshift(A11);
ww=real(A11);
plot(ww); %显示频谱

%带通滤波
H11=ones(h1,l1);
H11(:,yz_1:yz_2)=0;
result11=A11.*H11;   %对应元素相乘
result11=ifftshift(result11);
X21=ifft2(result11);
X31=(real(X21));     %取实部

%带阻滤波
% H11=zeros(h1,l1);
% H11(:,yz_1:yz_2)=1;
% result11=A11.*H11;   %对应元素相乘
% result11=ifftshift(result11);
% X21=ifft2(result11);
% X31=(real(X21));     %取实部

figure
plot(aa);     %显示原图
hold on
plot(X31,'r')  %显示滤波后的时域图