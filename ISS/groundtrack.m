function groundtrack
 
clc
clear
format long g
close all
 
ae = 6378.1363e3;  % semi-major axis of ellipsoid [m]
a = (ae+400*1000); % semimajor axis of a leo orbit [m]
e = 0.0007;        % eccentricity
i = 69;            % inclination [deg]
Omega = 0;         % right ascension of ascending node [deg]
omega = 0;         % argument of perigee [deg]
M0 = 0;            % mean anomaly at t=0 [deg]
 
to = juliandate(2018,06,01,12,30,50);
tf = juliandate(2018,06,02,12,30,50);
 
Y = kep2cart(a,e,i,Omega,omega,M0,'mea');
 
step = 30;
span = 0:step:(tf-to)*86400;
 
option = odeset('RelTol',1e-12,'AbsTol',1e-12,'NormControl','on');
[~,r] = ode45(@Deriv,span,Y,option);
 
n = length(span);
ref = zeros(n,3);
lamda = zeros(n,1);
phi = zeros(n,1);
height = zeros(n,1);
 
for i=1:n
    to = to+step/86400;
    U = R_z(gmst(to-2400000.5));
    ref(i,1:3) = U*r(i,1:3)';
    [lamda(i),phi(i),height(i)] = Geodetic(ref(i,:));
end
 
figure
geoshow('landareas.shp','FaceColor',[0.5 1 0.5]);
title('International Space Station Ground Track','FontSize',40)
hold on
plot(lamda*(180/pi),phi*(180/pi),'k','Linewidth',1)
set(gca,'Color',[0,0.7,1])
 
% animation
an = animatedline('Marker','.','MarkerEdgeColor', [1 0 0], 'Markersize',50);
 
for k = 1:n
    
    addpoints(an,lamda(k)*(180/pi),phi(k)*(180/pi));
    drawnow
   % pause(0.01);
    clearpoints(an);
end
 
end
 
