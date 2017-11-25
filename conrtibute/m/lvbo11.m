function X3= lvbo11( D,yz_begin,yz_end )

[N1,N2]=size(D);

A=fft2(D,N1,N2);
A=fftshift(A);

amn=yz_begin;

H=zeros(N1,N2);    %¥¥Ω®¡„æÿ’Û
H(:,yz_begin:yz_end)=1;   %¬À≤®„–÷µ
 
result=A.*H;

result=ifftshift(result);
X2=ifft2(result);
X3=double(real(X2));
end

