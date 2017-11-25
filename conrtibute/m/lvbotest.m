
imdata11 = imread('1.JPG');% 读取图像
M11=(imdata11(a_begin:a_end,b_begin:b_end));%取中间图像
figure(1)
imshow(M11)
figure(2)
plot(M11(100,:))
hold on
[h1,l1]=size(M11);
A11=fft2(M11,h1,l1);
A11=fftshift(A11);
ww=real(A11);
H11=zeros(h1,l1);

H11(:,yz_begin:yz_end)=1;
result11=A11.*H11;   %对应元素相乘
result11=ifftshift(result11);
X21=ifft2(result11);
X31=(real(X21));     %取实部
plot(X31(100,:),'r')  %显示滤波后的时域图
figure(3)
plot(ww(fix(h1/2)+1,:))    %显示频谱图

imdata_wuti = imread('9.JPG');% 读取图像
M_wuti=(imdata_wuti(a_begin:a_end,b_begin:b_end));%取中间图像
figure(4)
imshow(M_wuti)