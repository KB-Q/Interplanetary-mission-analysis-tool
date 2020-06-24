function orbitanimate2(pos,t)
Re = 6378.137;
 
f=imread("/Users/pranavcondur4/Desktop/1024px-Land_ocean_ice_2048.jpg")

[x y z]=sphere(40);
X = x.*Re;
Y = y.*Re;
Z = -z.*Re;
 
he=surf(X,Y,Z,'CData',f,...
    'Facecolor','texturemap');
 
set(he,'EdgeColor', 'none')
 
%shading interp
 
axis equal
 
x=pos(1,:);
y=pos(2,:);
z=pos(3,:);
 
 
h=animatedline('Color','r','LineWidth',0.02);
 
hold on;
title('International Space Station','FontSize',40)
set(gca,'Color',[0,0,0])
 
plot3(x,y,z,'g')
 
an = animatedline('Color','red','Marker','.', 'Markersize',50);
%camzoom(1.3)
for i=1:length(x)
    
    %comet3(x(i),y(i),z(i))
    addpoints(an,x(i),y(i),z(i));
    drawnow
    %pause(0.000000002);
    clearpoints(an);
     theta=0.000106*i
    
    direction = [0 0 1];
    rotate(he,direction,theta)
end
     
    
    
%thetaE = 7.2921159*10^(-5)
%rotate(he,direction,thetaE)
