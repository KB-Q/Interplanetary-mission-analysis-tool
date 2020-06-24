function apollo_orbit

R = 6378e3 + 191.2e3; %Radius of Earth Parking Orbit
vi = 7792.801; %velocity of the rocket at this altitude
rv = [R, 0, 0, 0, vi/sqrt(2), vi/sqrt(2)]; %defining the initial position, the initial direction and velocity of the rocket in the parking orbit

r_moon = 1741e3; %radius of moon

%odesolving
opt = odeset('RelTol', 1e-8, 'AbsTol', 1e-8);
[t,X] = ode45(@rate, [0 1.5*5296], rv, opt); 
%calling the rate function here from another file

[x,y,z] = sphere; % variables for the 3D Earth mesh
r_earth = 6378*1000; % radius of Earth

figure(1); clf; % starting the 3D figure
ax = axes;

cdata = imread('1024px-Land_ocean_ice_2048.jpg'); % photo of Earth's map taken from Wikimedia commons
alpha = 1;

hs1 = surf(x*r_earth,y*r_earth,-z*r_earth); % plotting 3D Earth
% changing the parameters in hs1 to make the background black and make the
% Earth fully opaque
set(hs1, 'FaceColor', 'texturemap', 'CData', cdata, 'FaceAlpha', alpha, 'EdgeColor', 'none')
set(gcf, 'Color', 'k')
set(gca, 'visible', 'off')

hold on % starting the orbit plot
axis equal
view(21,10); % changing the viewing angle to view the orbit better

str = {'Liftoff', 'Kennedy Space',  'center,','9:32 AM EDT', '16 July `69'}; % text to show important milestones in the orbit
text(R,-7*R/2,3*R/4, str, 'Fontsize', 10, 'Color', 'w');

str = {'6569 km', 'Earth Parking', 'orbit', '9:43 AM EDT', '16 July `69'};
text(R,0,0, str, 'Fontsize', 10, 'Color', 'w');

h = animatedline('Color', 'g', 'Markersize', 0.5, 'Linewidth', 1.5); 
for m = 1:605 % plotting the parking orbit
    addpoints(h, X(m,1), X(m,2), X(m,3))
    drawnow
end

hold off;

str2 = {'Translunar   ' , 'Coast  ', 'Injection  ', '12:22 PM EDT  ', '16 July `69  '};
text(X(605,1), -X(605,2), X(605,3), str2, 'Fontsize', 10, 'Color', 'w', 'HorizontalAlignment', 'right');

vf = norm([X(605,4) X(605,5) X(605,6)]); % getting initial values for the translunar coast using the final values from the parking orbit
k = 10.9e3/vf;
rv2 = [X(605,1) X(605,2) X(605,3) k*X(605,4) k*X(605,5) k*X(605,6)];

[t,X] = ode45(@rate, [0 263134/2], rv2, opt); % solving the ode for translunar coast

hold on

for m = 1:425 % plotting the translunar coast
    addpoints(h, X(m,1), X(m,2), X(m,3))
    drawnow    
end
text(X(212,1),X(212,2),X(212,3), 'Translunar coast', 'Fontsize', 100, 'Color', 'w');

hold off;
clf; % clearing the simulation. This is done so that the lunar orbit can be showed closer, which can only be done in a new simulation.
cdata2 = imread('moon_map.jpg'); % plotting 3D moon mesh
[x ,y, z] = sphere;
hs2 = surf(x*r_moon, y*r_moon, -z*r_moon);

set(hs2, 'FaceColor', 'texturemap', 'CData', cdata2, 'FaceAlpha', alpha, 'EdgeColor', 'none')
set(gcf, 'Color', 'k')
set(gca, 'visible', 'off')

 rmorbit = 1848.053e3; % radius of lunar orbit
 vm = 1609.344; % velocity of rocket in the lunar orbit
 
 rv3 = [rmorbit 0 0 0 vm/sqrt(2) vm/sqrt(2)];
 [t,X] = ode45(@rate_moon, [0 2*2*3600], rv3, opt); %solving ode for lunar orbit
 
 hold on
 axis equal
 view(42,28);
 h = animatedline('Color', 'g', 'Markersize', 0.5, 'Linewidth', 1.5);
 
 for m = 1:20:3248 % plotting the continuation of the translunar coast orbit in the new simulation and joining it with the lunar orbit
     addpoints(h, rmorbit, -2*rmorbit+vm/sqrt(2)*m+10, -2*rmorbit+vm/sqrt(2)*m+10)
     drawnow
 end
 
 str3 = {'Lunar Orbit Insertion', '1:21 PM EDT', '19 July 1969'};
 text(rmorbit, 0, 0, str3, 'Fontsize', 10, 'Color', 'w');
 
 for m = 1:821 % plotting the lunar orbit
     addpoints(h, X(m,1), X(m,2), X(m,3))
     drawnow
 end
end
