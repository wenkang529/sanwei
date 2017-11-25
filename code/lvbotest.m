% step 1:
%set the size of image capture
img1 = imread('1.JPG');
[pic_begin,pic_end]=size(img1);

%image capture
a_begin=1500;
b_begin=1200;
a_end=2500;
b_end=2200;

%filter cut-off frequency
yz_begin=460;
yz_end=560;


img1cap=(img1(a_begin:a_end,b_begin:b_end));

[h1,l1]=size(img1cap);

%after fft2  we should do fftshif to moving the zero-frequecy component to
%the center of the array
Aimg=fft2(img1cap,h1,l1);
Aimg=fftshift(Aimg);
AAimg=real(Aimg);

%set the convolution fuction
H=zeros(h1,l1);
H(:,yz_begin:yz_end)=1;
result11=Aimg.*H;   

%inverse fourier transform
result11=ifftshift(result11);
X2=ifft2(result11);
X1=(real(X2));    

figure('name',"sine nature")
plot(img1cap(100,:))
hold on
plot(X1(100,:),'r')

figure('name',"filter")
plot(AAimg(fix(h1/2)+1,:))    

%picture of object capture
img2 = imread('9.JPG');
img2cap=(img2(a_begin:a_end,b_begin:b_end));
figure('name',"object")
imshow(img2cap)