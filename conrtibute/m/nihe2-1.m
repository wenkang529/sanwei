load('wuti.mat');
load('pingmian.mat');
load('xhlq.mat');
[h,l]=size(result_w);
for n=1:h
w=result_w(n,:);
p=result_p(n,:);
pn=nihe(p,1);
wn=nihe(w,8);
jg(n,:)=wn-pn;
end

figure
xiao22=jg;
surf(-xiao22)
colormap(gray);                            %����colormap( )����Ϊͼ������ɫ��
shading interp;                            %������ɫ
light('Position',[0,0,100],'style','infinite');   %����light( )����Ϊͼ�����ù���Ч��
light('Position',[1000,0,100],'style','infinite');
light('Position',[400,400,100],'style','infinite');
view(-90,90);                                    %�ӵ㴦��
lighting gouraud; 