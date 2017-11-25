function result= lvbo11( D,yz_begin,yz_end )
%bandpass filter
% D:matrix  yz_begin,yz_end: cut-off frequncy
[N1,N2]=size(D);
A=fft2(D,N1,N2);
A=fftshift(A);

H=zeros(N1,N2);    
H(:,yz_begin:yz_end)=1;   
 
re1=A.*H;

re1=ifftshift(re1);
re2=ifft2(re1);
result=double(real(re2));
end

