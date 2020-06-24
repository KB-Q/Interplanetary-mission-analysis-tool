function chand2(pos1,pos2,pos3,pos4,pos5,pos6,dt,pos1m,pos2m,pos3m,pos4m,pos5m,pos6m,pos7m,pos8m,dtm,o1,o2,o3,o4,o5,o6)
dem=384400;
Re = 6378.137;
w=(7.2921159e-5)*(180/pi);
rm=1737.1;
wm=(2.7e-6)*(180/pi)*5;
fe=imread("C:\Users\Sarthak Singh\Documents\MATLAB\Horizon Project\earth.jpg");
fm=imread("C:\Users\Sarthak Singh\Documents\MATLAB\Horizon Project\moon_map.jpg");
figure(3);
%set(gca,'color','k');
%set(gcf,'inverthardcopy','off');
[x y z]=sphere(50);
he=surf(x*Re-0,y*Re-0,-z*Re-0,'CData',fe,'FaceColor','texturemap','EdgeColor','none');
view(-77,11);
hold on;
hm=surf(x*rm-dem,y*rm-0,-z*rm-0,'CData',fm,'FaceColor','texturemap','EdgeColor','none');
%view(80,33);
%set(he,'Facecolor',[0 0 1]);
%xImage = [0 0;  ];   % The x data for the image corners
%yImage = [0 0; 0 0];             % The y data for the image corners
%zImage = [Re -Re; -0.5 -0.5];   % The z data for the image corners
%surf(xImage,yImage,zImage,...    % Plot the surface
  %   'CData',img,...
     %'FaceColor','texturemap');
x1=pos1(1,:);
y1=pos1(2,:);
z1=pos1(3,:);
x2=pos2(1,:);
y2=pos2(2,:);
z2=pos2(3,:);
x3=pos3(1,:);
y3=pos3(2,:);
z3=pos3(3,:);
x4=pos4(1,:);
y4=pos4(2,:);
z4=pos4(3,:);
x5=pos5(1,:);
y5=pos5(2,:);
z5=pos5(3,:);
x6=pos6(1,:);
y6=pos6(2,:);
z6=pos6(3,:);
x1m=pos1m(1,:);
y1m=pos1m(2,:);
z1m=pos1m(3,:);
x2m=pos2m(1,:);
y2m=pos2m(2,:);
z2m=pos2m(3,:);
x3m=pos3m(1,:);
y3m=pos3m(2,:);
z3m=pos3m(3,:);
x4m=pos4m(1,:);
y4m=pos4m(2,:);
z4m=pos4m(3,:);
x5m=pos5m(1,:);
y5m=pos5m(2,:);
z5m=pos5m(3,:);
x6m=pos6m(1,:);
y6m=pos6m(2,:);
z6m=pos6m(3,:);
x7m=pos7m(1,:);
y7m=pos7m(2,:);
z7m=pos7m(3,:);
x8m=pos8m(1,:);
y8m=pos8m(2,:);
z8m=pos8m(3,:);
%x6=-40540:5000:40540;
%y6=-40540:5000:40540;
%z6=zeros(length(x6),length(y6));
%h6=surf(x6,y6,z6,'FaceAlpha',0.1);
%h6.EdgeColor='none';
whitebg([0 0 0])
grid off;
xlabel("X");
ylabel("Y");
zlabel("Z");
axis equal
axis([-4.5e5,0.25e5,-4e4,6e4,-7000,7000])
h1=animatedline('Color','g','Marker','.','MarkerSize',1,'MarkerFaceColor',[0 1 0],'LineWidth',0.8);
h2=animatedline('Color','g','Marker','.','MarkerSize',1,'MarkerFaceColor',[0 1 0],'LineWidth',0.8);
h3=animatedline('Color','g','Marker','.','MarkerSize',1,'MarkerFaceColor',[0 1 0],'LineWidth',0.8);
h4=animatedline('Color','g','Marker','.','MarkerSize',1,'MarkerFaceColor',[0 1 0],'LineWidth',0.8);
h5=animatedline('Color','g','Marker','.','MarkerSize',1,'MarkerFaceColor',[0 1 0],'LineWidth',0.8);
h6=animatedline('Color','y','Marker','.','MarkerSize',1,'MarkerFaceColor',[0 1 0],'LineWidth',0.8);
h1m=animatedline('Color','r','Marker','.','MarkerSize',1,'MarkerFaceColor',[0 1 0],'LineWidth',0.5);
h2m=animatedline('Color','r','Marker','.','MarkerSize',1,'MarkerFaceColor',[0 1 0],'LineWidth',0.5);
h3m=animatedline('Color','r','Marker','.','MarkerSize',1,'MarkerFaceColor',[0 1 0],'LineWidth',0.5);
h4m=animatedline('Color','r','Marker','.','MarkerSize',1,'MarkerFaceColor',[0 1 0],'LineWidth',0.5);
h5m=animatedline('Color','r','Marker','.','MarkerSize',1,'MarkerFaceColor',[0 1 0],'LineWidth',0.5);
h6m=animatedline('Color','r','Marker','.','MarkerSize',1,'MarkerFaceColor',[0 1 0],'LineWidth',0.5);
h7m=animatedline('Color','r','Marker','.','MarkerSize',1,'MarkerFaceColor',[0 1 0],'LineWidth',0.5);
h8m=animatedline('Color','r','Marker','.','MarkerSize',1,'MarkerFaceColor',[0 1 0],'LineWidth',0.5);
dir=[0 sin((23.13*pi)/180) cos((23.13*pi)/180)];
dirm=[0 sin((6.68*pi)/180) cos((6.68*pi)/180)];
center=[0 0 0];
centerm=[-dem 0 0];
%while 1
%rotate(he,dir,w*dt)
%end
for i=1:length(x1)
    addpoints(h1,x1(i),y1(i),z1(i));
    rotate(he,dir,w*dt,center)
    rotate(hm,dirm,wm*dtm,centerm)
    %addpoints(h2,x2(i),y2(i),z2(i));
    drawnow
end
plot3(o1(1),o1(2),o1(3),'.w');
text(o1(1),o1(2)+1000,o1(3),'45163 km','color','r')
for i=1:length(x2)
    rotate(he,dir,w*dt,center)
    rotate(hm,dirm,wm*dtm,centerm)
    addpoints(h2,x2(i),y2(i),z2(i));
    drawnow
end
plot3(o2(1),o2(2),o2(3),'.w');
text(o2(1),o2(2)+1000,o2(3)-700,'54829 km','color','r')
for i=1:length(x3)
    rotate(he,dir,w*dt,center)
    rotate(hm,dirm,wm*dtm,centerm)
    addpoints(h3,x3(i),y3(i),z3(i));
    drawnow
end
plot3(o3(1),o3(2),o3(3),'.w');
text(o3(1),o3(2)+1000,o3(3)-1000,'71792 km','color','r')
for i=1:length(x4)
    rotate(he,dir,w*dt,center)
    rotate(hm,dirm,wm*dtm,centerm)
    addpoints(h4,x4(i),y4(i),z4(i));
    drawnow
end
plot3(o4(1),o4(2),o4(3),'.w');
text(o4(1),o4(2),o4(3)-1000,'89472 km','color','r')
for i=1:length(x5)
    rotate(he,dir,w*dt,center)
    rotate(hm,dirm,wm*dtm,centerm)
    addpoints(h5,x5(i),y5(i),z5(i));
    drawnow
end
plot3(o5(1),o5(2),o5(3),'.w');
text(o5(1),o5(2)+1000,o5(3)-1000,'142975 km','color','r')
for i=1:floor(0.5*length(x6))
    rotate(he,dir,w*dt,center)
    rotate(hm,dirm,wm*dt,centerm)
    addpoints(h6,x6(i),y6(i),z6(i));
    drawnow
end
text(x6(floor(0.2*length(x6))),y6(floor(0.2*length(x6)))+100,z6(floor(0.2*length(x6))),'Lunar Transfer Orbit','color','r')
for i=floor(0.5*length(x1m)):length(x1m)
    rotate(hm,dirm,wm*dt,centerm)
    rotate(he,dir,w*dt,center)
    addpoints(h1m,x1m(i),y1m(i),z1m(i));
    drawnow
end
for i=1:floor(0.5*length(x7m))
    rotate(hm,dirm,wm*dt,centerm)
    rotate(he,dir,w*dt,center)
    addpoints(h7m,x7m(i),y7m(i),z7m(i));
    drawnow
end
text(x7m(1)+10000,y7m(1)+200,z7m(1),'Selenocentric Phase','color','g')
for i=floor(0.5*length(x8m)):length(x8m)
    rotate(hm,dirm,wm*dt,centerm)
    rotate(he,dir,w*dt,center)
    addpoints(h8m,x8m(i),y8m(i),z8m(i));
    drawnow
end
for i=1:length(x2m)
    rotate(hm,dirm,wm*dt,centerm)
    rotate(he,dir,w*dt,center)
    addpoints(h2m,x2m(i),y2m(i),z2m(i));
    drawnow
end
for i=1:length(x3m)
    rotate(hm,dirm,wm*dt,centerm)
    rotate(he,dir,w*dt,center)
    addpoints(h3m,x3m(i),y3m(i),z3m(i));
    drawnow
end
for i=1:length(x4m)
    rotate(hm,dirm,wm*dt,centerm)
    rotate(he,dir,w*dt,center)
    addpoints(h4m,x4m(i),y4m(i),z4m(i));
    drawnow
end
for i=1:length(x5m)
    rotate(hm,dirm,wm*dt,centerm)
    rotate(he,dir,w*dt,center)
    addpoints(h5m,x5m(i),y5m(i),z5m(i));
    drawnow
end
for i=1:length(x6m)
    rotate(hm,dirm,wm*dt,centerm)
    rotate(he,dir,w*dt,center)
    addpoints(h6m,x6m(i),y6m(i),z6m(i));
    drawnow
end
for i=1:500
    rotate(he,dir,w*dt,center)
    rotate(hm,dirm,wm*dt,centerm)
    %plot3(0,0,0)
    drawnow
end
