function result=lkget_t(im,del,im2,flag)
%??im   ?????   ????? del  flag  ??????? ????  ????????
%???????????? ???????????
im=im(400:1200,2300:3300,:);

im_2=rgb2gray(im); 
%????
bin_w =im2bw(im_2);
SE=strel('square',25);
peng_w=imdilate(bin_w,SE);
fill_w = bwfill(peng_w,'holes');
del_w = bwareaopen(fill_w,del);
 %????     
contour = bwperim(del_w);  
% contour = edge(dw ,'canny'); 
cfill1 = bwfill(contour,'holes');
cfill1 = uint8(cfill1);
result1 = cfill1.*im_2;

if(flag)
    cfill2=~cfill1;
    cfill2 = uint8(cfill2);  
    im21=uint8(im2);
    r=cfill2.*im21;
    r1=r+result1;
else
    r1=result1;
end

result=double(r1);
