clc
fz=0.5*pi;

h1=cc;
[h,l]=size(h1);
mh=fix(h/2);
ml=fix(l/2);





for i2=1:h
    for i1=ml:l
        a1=h1(i2,i1);
        m2=myaverage(h1,i2,i1-1);
        if (abs(m2-a1)>fz)
            if( h1(i2,i1)~=0)
                h1(i2,i1)=err_p1(a1,m2,fz);
            end
        end
    end
    
    for i1=1:ml
        i3=ml-i1+1;
        a1=h1(i2,i3);
        m2=h1(i2,i3+1);
        if (abs(m2-a1)>fz)
            if( h1(i2,i3)~=0)
                h1(i2,i3)=err_p1(a1,m2,fz);
            end
        end
    end
    
end


h1=h1';
[h,l]=size(h1);
mh=fix(h/2);
ml=fix(l/2);
for i2=1:h
    for i1=ml:l
        a1=h1(i2,i1);
        m2=myaverage(h1,i2,i1-1);
        if (abs(m2-a1)>fz)
            if( h1(i2,i1)~=0)
                h1(i2,i1)=m2;
            end
        end
    end
    
    for i1=1:ml
        i3=ml-i1+1;
        a1=h1(i2,i3);
        m2=h1(i2,i3+1);
        if (abs(m2-a1)>fz)
            if( h1(i2,i3)~=0)
                h1(i2,i3)=m2;
            end
        end
    end
    
end


xiao22=h1';
surf(-xiao22)
colormap(gray);                            %利用colormap( )函数为图像定义颜色集
shading interp;                            %设置颜色
light('Position',[0,0,100],'style','infinite');   %利用light( )函数为图像设置光照效果
light('Position',[1000,0,100],'style','infinite');
light('Position',[400,400,100],'style','infinite');
view(-90,90);                                    %视点处理
lighting gouraud; 