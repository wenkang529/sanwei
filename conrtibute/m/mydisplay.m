

xiao22=xhlq;

figure
surf(xiao22)
colormap(gray);                            %����colormap( )����Ϊͼ������ɫ��
shading interp;                            %������ɫ
light('Position',[0,0,100],'style','infinite');   %����light( )����Ϊͼ�����ù���Ч��
light('Position',[1000,0,100],'style','infinite');
light('Position',[400,400,100],'style','infinite');
view(-90,90);                                    %�ӵ㴦��
lighting gouraud; 