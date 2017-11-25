function imdata11=lkget(im,del)
%im?????   del????????  ?? 1000000
%?????? 
%im1=rgb2gray(im);
bw =im2bw(im);
dw = bwareaopen(bw,del);
contour = bwperim(dw);  
% contour = edge(bw ,'canny'); 
cfill = bwfill(contour,'holes');
%cfill = uint8(cfill);
imdata11 = cfill.*im;
% figure
% imshow(imdata1);  
% title('??') lk