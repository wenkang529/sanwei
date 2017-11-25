function Mix= mixture(blank,leaf,wall)

a = blank;
g = a(:,:,1);

kt1 = g>70; 
kt1 = bwfill(kt1,'holes');
kt1 = bwareaopen(kt1,1000);%inside 1 ouside 0
kt2 = ~kt1; % outside 1 inside 0
kt1 = uint8(kt1);
kt2 = uint8(kt2);



imdata1 = leaf.*kt1;
imdata2 = wall.*kt2;
Mix= imdata1+imdata2;