function result=lkget_t(im,del,im2,flag)
%数据im   可以是条纹   删除的范围 del  flag  判断是否是物体 物体为一  因为物体需要抠图
im=im(400:1200,2300:3300,:);

im_2=rgb2gray(im); 
%图像膨胀
bin_w =im2bw(im_2);
SE=strel('square',25);
peng_w=imdilate(bin_w,SE);
fill_w = bwfill(peng_w,'holes');
del_w = bwareaopen(fill_w,del);
 %轮廓提取     
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
