%???????? ?????????? ???? ?????????????

imdata11 = imread('1.JPG');% ????
a_begin=1;
b_begin=1;
[a_end,b_end]=size(imdata11);


M11=(imdata11(a_begin:a_end,b_begin:b_end));%?????
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
plot(ww);

H11(:,yz_begin:yz_end)=1;
result11=A11.*H11;   %??????
result11=ifftshift(result11);
X21=ifft2(result11);
X31=(real(X21));     %???
plot(X31(100,:),'r')  %?????????
figure(3)
plot(ww(fix(h1/2)+1,:))    %?????

imdata_wuti = imread('9.JPG');% ????
M_wuti=(imdata_wuti(a_begin:a_end,b_begin:b_end));%?????
figure(4)
imshow(M_wuti)