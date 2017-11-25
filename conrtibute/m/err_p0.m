
function result=err_p0(aa,yz1,yz2)    %每一行的值，判断阈值yz1，纠错阈值yz2  %或者整个数组
[h,l]=size(aa);
ww02=aa;
for j2=1:h
for j1=10:l-10   
%纠正九个错误的
    if((abs(ww02(j2,j1)-ww02(j2,j1-1))>yz1)&&(abs(ww02(j2,j1+8)-ww02(j2,j1+9))>yz1)&&(abs(ww02(j2,j1+9)-ww02(j2,j1-1))<(0.5*pi))&&(abs(ww02(j2,j1)-ww02(j2,j1+1))<(0.5*pi))&&(abs(ww02(j2,j1+2)-ww02(j2,j1+1))<(0.5*pi))&&(abs(ww02(j2,j1+2)-ww02(j2,j1+3))<(0.5*pi))&&(abs(ww02(j2,j1+4)-ww02(j2,j1+3))<(0.5*pi))&&(abs(ww02(j2,j1+4)-ww02(j2,j1+5))<(0.5*pi))&&(abs(ww02(j2,j1+6)-ww02(j2,j1+5))<(0.5*pi))&&(abs(ww02(j2,j1+6)-ww02(j2,j1+7))<(0.5*pi))&&(abs(ww02(j2,j1+8)-ww02(j2,j1+7))<(0.5*pi)))  
    jz1=err_p1(ww02(j2,j1),ww02(j2,j1-1),yz2);
    aa(j2,j1)=jz1;
    jz2=err_p1(ww02(j2,(j1+1)),ww02(j2,j1-1),yz2);
    aa(j2,j1+1)=jz2;
    jz3=err_p1(ww02(j2,(j1+2)),ww02(j2,j1-1),yz2);
    aa(j2,j1+2)=jz3;
    jz4=err_p1(ww02(j2,(j1+3)),ww02(j2,j1-1),yz2);
    aa(j2,j1+3)=jz4;
    jz5=err_p1(ww02(j2,(j1+4)),ww02(j2,j1-1),yz2);
    aa(j2,j1+4)=jz5;
    jz6=err_p1(ww02(j2,(j1+5)),ww02(j2,j1-1),yz2);
    aa(j2,j1+5)=jz6;
    jz7=err_p1(ww02(j2,(j1+6)),ww02(j2,j1-1),yz2);
    aa(j2,j1+6)=jz7;
    jz8=err_p1(ww02(j2,(j1+7)),ww02(j2,j1-1),yz2);
    aa(j2,j1+7)=jz8;
    jz9=err_p1(ww02(j2,(j1+8)),ww02(j2,j1-1),yz2);
    aa(j2,j1+8)=jz9;
    m(1,j1)=5;
    end  
    
%纠正八个错误的
    if((abs(ww02(j2,j1)-ww02(j2,j1-1))>yz1)&&(abs(ww02(j2,j1+8)-ww02(j2,j1+7))>yz1)&&(abs(ww02(j2,j1+8)-ww02(j2,j1-1))<(0.5*pi))&&(abs(ww02(j2,j1)-ww02(j2,j1+1))<(0.5*pi))&&(abs(ww02(j2,j1+2)-ww02(j2,j1+1))<(0.5*pi))&&(abs(ww02(j2,j1+2)-ww02(j2,j1+3))<(0.5*pi))&&(abs(ww02(j2,j1+4)-ww02(j2,j1+3))<(0.5*pi))&&(abs(ww02(j2,j1+4)-ww02(j2,j1+5))<(0.5*pi))&&(abs(ww02(j2,j1+6)-ww02(j2,j1+5))<(0.5*pi))&&(abs(ww02(j2,j1+6)-ww02(j2,j1+7))<(0.5*pi)))  
    jz1=err_p1(ww02(j2,j1),ww02(j2,j1-1),yz2);
    aa(j2,j1)=jz1;
    jz2=err_p1(ww02(j2,(j1+1)),ww02(j2,j1-1),yz2);
    aa(j2,j1+1)=jz2;
    jz3=err_p1(ww02(j2,(j1+2)),ww02(j2,j1-1),yz2);
    aa(j2,j1+2)=jz3;
    jz4=err_p1(ww02(j2,(j1+3)),ww02(j2,j1-1),yz2);
    aa(j2,j1+3)=jz4;
    jz5=err_p1(ww02(j2,(j1+4)),ww02(j2,j1-1),yz2);
    aa(j2,j1+4)=jz5;
    jz6=err_p1(ww02(j2,(j1+5)),ww02(j2,j1-1),yz2);
    aa(j2,j1+5)=jz6;
    jz7=err_p1(ww02(j2,(j1+6)),ww02(j2,j1-1),yz2);
    aa(j2,j1+6)=jz7;
    jz8=err_p1(ww02(j2,(j1+7)),ww02(j2,j1-1),yz2);
    aa(j2,j1+7)=jz8;
    m(1,j1)=5;
    end   
    
%纠正七个错误的
    if((abs(ww02(j2,j1)-ww02(j2,j1-1))>yz1)&&(abs(ww02(j2,j1+6)-ww02(j2,j1+7))>yz1)&&(abs(ww02(j2,j1+7)-ww02(j2,j1-1))<(0.5*pi))&&(abs(ww02(j2,j1)-ww02(j2,j1+1))<(0.5*pi))&&(abs(ww02(j2,j1+2)-ww02(j2,j1+1))<(0.5*pi))&&(abs(ww02(j2,j1+2)-ww02(j2,j1+3))<(0.5*pi))&&(abs(ww02(j2,j1+4)-ww02(j2,j1+3))<(0.5*pi))&&(abs(ww02(j2,j1+4)-ww02(j2,j1+5))<(0.5*pi))&&(abs(ww02(j2,j1+6)-ww02(j2,j1+5))<(0.5*pi)))  
    jz1=err_p1(ww02(j2,j1),ww02(j2,j1-1),yz2);
    aa(j2,j1)=jz1;
    jz2=err_p1(ww02(j2,(j1+1)),ww02(j2,j1-1),yz2);
    aa(j2,j1+1)=jz2;
    jz3=err_p1(ww02(j2,(j1+2)),ww02(j2,j1-1),yz2);
    aa(j2,j1+2)=jz3;
    jz4=err_p1(ww02(j2,(j1+3)),ww02(j2,j1-1),yz2);
    aa(j2,j1+3)=jz4;
    jz5=err_p1(ww02(j2,(j1+4)),ww02(j2,j1-1),yz2);
    aa(j2,j1+4)=jz5;
    jz6=err_p1(ww02(j2,(j1+5)),ww02(j2,j1-1),yz2);
    aa(j2,j1+5)=jz6;
    jz7=err_p1(ww02(j2,(j1+6)),ww02(j2,j1-1),yz2);
    aa(j2,j1+6)=jz7;
    m(1,j1)=5;
    end      

%纠正六个错误的
    if((abs(ww02(j2,j1)-ww02(j2,j1-1))>yz1)&&(abs(ww02(j2,j1+6)-ww02(j2,j1+5))>yz1)&&(abs(ww02(j2,j1+6)-ww02(j2,j1-1))<(0.5*pi))&&(abs(ww02(j2,j1)-ww02(j2,j1+1))<(0.5*pi))&&(abs(ww02(j2,j1+2)-ww02(j2,j1+1))<(0.5*pi))&&(abs(ww02(j2,j1+2)-ww02(j2,j1+3))<(0.5*pi))&&(abs(ww02(j2,j1+4)-ww02(j2,j1+3))<(0.5*pi))&&(abs(ww02(j2,j1+4)-ww02(j2,j1+5))<(0.5*pi)))  
    jz1=err_p1(ww02(j2,j1),ww02(j2,j1-1),yz2);
    aa(j2,j1)=jz1;
    jz2=err_p1(ww02(j2,(j1+1)),ww02(j2,j1-1),yz2);
    aa(j2,j1+1)=jz2;
    jz3=err_p1(ww02(j2,(j1+2)),ww02(j2,j1-1),yz2);
    aa(j2,j1+2)=jz3;
    jz4=err_p1(ww02(j2,(j1+3)),ww02(j2,j1-1),yz2);
    aa(j2,j1+3)=jz4;
    jz5=err_p1(ww02(j2,(j1+4)),ww02(j2,j1-1),yz2);
    aa(j2,j1+4)=jz5;
    jz6=err_p1(ww02(j2,(j1+5)),ww02(j2,j1-1),yz2);
    aa(j2,j1+5)=jz6;
    m(1,j1)=5;
    end  
    
%纠正五个错误的
    if((abs(ww02(j2,j1)-ww02(j2,j1-1))>yz1)&&(abs(ww02(j2,j1+4)-ww02(j2,j1+5))>yz1)&&(abs(ww02(j2,j1+5)-ww02(j2,j1-1))<(0.5*pi))&&(abs(ww02(j2,j1)-ww02(j2,j1+1))<(0.5*pi))&&(abs(ww02(j2,j1+2)-ww02(j2,j1+1))<(0.5*pi))&&(abs(ww02(j2,j1+2)-ww02(j2,j1+3))<(0.5*pi))&&(abs(ww02(j2,j1+4)-ww02(j2,j1+3))<(0.5*pi)))  
    jz1=err_p1(ww02(j2,j1),ww02(j2,j1-1),yz2);
    aa(j2,j1)=jz1;
    jz2=err_p1(ww02(j2,(j1+1)),ww02(j2,j1-1),yz2);
    aa(j2,j1+1)=jz2;
    jz3=err_p1(ww02(j2,(j1+2)),ww02(j2,j1-1),yz2);
    aa(j2,j1+2)=jz3;
    jz4=err_p1(ww02(j2,(j1+3)),ww02(j2,j1-1),yz2);
    aa(j2,j1+3)=jz4;
    jz5=err_p1(ww02(j2,(j1+4)),ww02(j2,j1-1),yz2);
    aa(j2,j1+4)=jz5;
    m(1,j1)=5;
    end  

%纠正四个错误的
    if((abs(ww02(j2,j1)-ww02(j2,j1-1))>yz1)&&(abs(ww02(j2,j1+4)-ww02(j2,j1+3))>yz1)&&(abs(ww02(j2,j1+4)-ww02(j2,j1-1))<(0.5*pi))&&(abs(ww02(j2,j1)-ww02(j2,j1+1))<(0.5*pi))&&(abs(ww02(j2,j1+2)-ww02(j2,j1+1))<(0.5*pi))&&(abs(ww02(j2,j1+2)-ww02(j2,j1+3))<(0.5*pi)))  
    jz1=err_p1(ww02(j2,j1),ww02(j2,j1-1),yz2);
    aa(j2,j1)=jz1;
    jz2=err_p1(ww02(j2,(j1+1)),ww02(j2,j1-1),yz2);
    aa(j2,j1+1)=jz2;
    jz3=err_p1(ww02(j2,(j1+2)),ww02(j2,j1-1),yz2);
    aa(j2,j1+2)=jz3;
    jz4=err_p1(ww02(j2,(j1+3)),ww02(j2,j1-1),yz2);
    aa(j2,j1+3)=jz4;
    m(1,j1)=5;
    end   

%纠正三个错误的
    if((abs(ww02(j2,j1)-ww02(j2,j1-1))>yz1)&&(abs(ww02(j2,j1+2)-ww02(j2,j1+3))>yz1)&&(abs(ww02(j2,j1+3)-ww02(j2,j1-1))<(0.5*pi))&&(abs(ww02(j2,j1)-ww02(j2,j1+1))<(0.5*pi))&&(abs(ww02(j2,j1+2)-ww02(j2,j1+1))<(0.5*pi)))  
    jz1=err_p1(ww02(j2,j1),ww02(j2,j1-1),yz2);
    aa(j2,j1)=jz1;
    jz2=err_p1(ww02(j2,(j1+1)),ww02(j2,j1-1),yz2);
    aa(j2,j1+1)=jz2;
    jz3=err_p1(ww02(j2,(j1+2)),ww02(j2,j1-1),yz2);
    aa(j2,j1+2)=jz3;
    m(1,j1)=5;
    end    

%纠正两个错误的
    if((abs(ww02(j2,j1)-ww02(j2,j1-1))>yz1)&&(abs(ww02(j2,j1+2)-ww02(j2,j1+1))>yz1)&&(abs(ww02(j2,j1+2)-ww02(j2,j1-1))<(0.5*pi))&&(abs(ww02(j2,j1)-ww02(j2,j1+1))<(0.5*pi)))  
    jz1=err_p1(ww02(j2,j1),ww02(j2,j1-1),yz2);
    aa(j2,j1)=jz1;
    jz2=err_p1(ww02(j2,(j1+1)),ww02(j2,j1-1),yz2);
    aa(j2,j1+1)=jz2;
    m(1,j1)=5;
    else
    m(1,j1)=1;
    end
    
%纠正一个错误
    if((abs(ww02(j2,j1)-ww02(j2,j1-1))>yz1)&&(abs(ww02(j2,j1)-ww02(j2,j1+1))>yz1)&&(abs(ww02(j2,j1+1)-ww02(j2,j1-1))<(0.5*pi)))        
    aa(j2,j1)=err_p1(ww02(j2,j1),ww02(j2,j1-1),yz2);
    end    
    
    
%纠正单个尖峰错误
    if((ww02(j2,j1)-ww02(j2,j1-1)>yz1)&&(ww02(j2,j1)-ww02(j2,j1+1)>yz1)) 
    right1=max(ww02(j2,j1-1),ww02(j2,j1+1));
    aa(j2,j1)=err_p1(ww02(j2,j1),right1,yz2);
    end       
    if((ww02(j2,j1-1)-ww02(j2,j1)>yz1)&&(ww02(j2,j1+1)-ww02(j2,j1)>yz1)) 
    right1=min(ww02(j2,j1-1),ww02(j2,j1+1));
    aa(j2,j1)=err_p1(ww02(j2,j1),right1,yz2);
    end    

    
    
%纠正双尖峰错误
    if((ww02(j2,j1)-ww02(j2,j1-1)>yz1)&&(ww02(j2,j1+1)-ww02(j2,j1+2)>yz1)&&abs(ww02(j2,j1)-ww02(j2,j1+1))<0.5*pi) 
    right1=max(ww02(j2,j1-1),ww02(j2,j1+2));
    aa(j2,j1)=err_p1(ww02(j2,j1),right1,yz2);
    aa(j2,j1+1)=err_p1(ww02(j2,j1+1),right1,yz2);
    end       
    if((ww02(j2,j1-1)-ww02(j2,j1)>yz1)&&(ww02(j2,j1+2)-ww02(j2,j1+1)>yz1)&&abs(ww02(j2,j1)-ww02(j2,j1+1))<0.5*pi) 
    right1=min(ww02(j2,j1-1),ww02(j2,j1+2));
    aa(j2,j1)=err_p1(ww02(j2,j1),right1,yz2);
    aa(j2,j1+1)=err_p1(ww02(j2,j1+1),right1,yz2);
    end    
    
%纠正三点尖峰错误
    if((ww02(j2,j1)-ww02(j2,j1-1)>yz1)&&(ww02(j2,j1+2)-ww02(j2,j1+3)>yz1)&&abs(ww02(j2,j1)-ww02(j2,j1+1))<0.5*pi&&abs(ww02(j2,j1+2)-ww02(j2,j1+1))<0.5*pi) 
    right1=max(ww02(j2,j1-1),ww02(j2,j1+3));
    aa(j2,j1)=err_p1(ww02(j2,j1),right1,yz2);
    aa(j2,j1+1)=err_p1(ww02(j2,j1+1),right1,yz2);
    aa(j2,j1+2)=err_p1(ww02(j2,j1+2),right1,yz2);
    end       
    if((ww02(j2,j1-1)-ww02(j2,j1)>yz1)&&(ww02(j2,j1+3)-ww02(j2,j1+2)>yz1)&&abs(ww02(j2,j1)-ww02(j2,j1+1))<0.5*pi&&abs(ww02(j2,j1+2)-ww02(j2,j1+1))<0.5*pi) 
    right1=min(ww02(j2,j1-1),ww02(j2,j1+3));
    aa(j2,j1)=err_p1(ww02(j2,j1),right1,yz2);
    aa(j2,j1+1)=err_p1(ww02(j2,j1+1),right1,yz2);
    aa(j2,j1+2)=err_p1(ww02(j2,j1+2),right1,yz2);
    end   
        
%纠正四点尖峰错误
    if((ww02(j2,j1)-ww02(j2,j1-1)>yz1)&&(ww02(j2,j1+4)-ww02(j2,j1+3)>yz1)&&abs(ww02(j2,j1)-ww02(j2,j1+1))<0.5*pi&&abs(ww02(j2,j1+2)-ww02(j2,j1+1))<0.5*pi&&abs(ww02(j2,j1+2)-ww02(j2,j1+3))<0.5*pi) 
    right1=max(ww02(j2,j1-1),ww02(j2,j1+4));
    aa(j2,j1)=err_p1(ww02(j2,j1),right1,yz2);
    aa(j2,j1+1)=err_p1(ww02(j2,j1+1),right1,yz2);
    aa(j2,j1+2)=err_p1(ww02(j2,j1+2),right1,yz2);
    aa(j2,j1+3)=err_p1(ww02(j2,j1+3),right1,yz2);
    end       
    if((ww02(j2,j1-1)-ww02(j2,j1)>yz1)&&(ww02(j2,j1+3)-ww02(j2,j1+4)>yz1)&&abs(ww02(j2,j1)-ww02(j2,j1+1))<0.5*pi&&abs(ww02(j2,j1+2)-ww02(j2,j1+1))<0.5*pi&&abs(ww02(j2,j1+3)-ww02(j2,j1+2))<0.5*pi) 
    right1=min(ww02(j2,j1-1),ww02(j2,j1+4));
    aa(j2,j1)=err_p1(ww02(j2,j1),right1,yz2);
    aa(j2,j1+1)=err_p1(ww02(j2,j1+1),right1,yz2);
    aa(j2,j1+2)=err_p1(ww02(j2,j1+2),right1,yz2);
    aa(j2,j1+3)=err_p1(ww02(j2,j1+3),right1,yz2);
    end   
end
end
result=aa;