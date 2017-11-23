function result=pic_deal(result_lk,h_begin,h_end,l_begin,l_end,im_1,im_2,flag)
% result_lk:?????????  im_1:??????? im_2:?????  flag:??  ?1?????? ?0??????
%???????
 w=fspecial('average');%3x3(??)?????
yz_begin=380;
yz_end=480;
im_1=rgb2gray(im_1);
im_1=im_1(h_begin:h_end,l_begin:l_end);
% im_1=lvbo11(im_1,yz_begin,yz_end);
% im_1=uint8(im_1);

if(flag)    
    im_2=uint8(im_2);
    lk1=~result_lk;
    lk1=uint8(lk1);
    r1=result_lk.*im_1;
    r2=lk1.*im_2;
    r=r1+r2;
    r=imfilter(r,w,'replicate');
    result=double(r);
      
else      

    im_1=imfilter(im_1,w,'replicate');
    im_1=lvbo11(im_1,yz_begin,yz_end);
    result=double(im_1);
end


















