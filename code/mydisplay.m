function mydisplay(display)
%diaplay the result
figure('name','display')
surf(display)
colormap(gray);                            %define a color set
shading interp;   
light('Position',[0,0,100],'style','infinite');   %add light and shadow effect
light('Position',[1000,0,100],'style','infinite');
light('Position',[400,400,100],'style','infinite');
view(90,90);                %set the perspective
lighting gouraud; 