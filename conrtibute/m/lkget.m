
function imdata11=lkget(im,del)
%im：图片数据   del：删除区域的大小  推荐 1000000
im1=rgb2gray(im);
bw =im2bw(im);
dw = bwareaopen(bw,del);
contour = bwperim(dw);  
% contour = edge(bw ,'canny'); 
cfill = bwfill(contour,'holes');
cfill = uint8(cfill);
imdata11 = cfill.*im1;
% figure
% imshow(imdata1);  
% title('提取') 
