function dxdt = rate(~,rv)

mu = 3.986004e14; % mu = G*Me, where Me is Mass of Earth and G is the Gravitational constant
Re = 6378.137e3; % radius of earth
J2 = 1.08263591e-3; % J2 propagator constant

x = rv(1); % storing all the initial conditions in separate variables
y = rv(2);
z = rv(3);
vx = rv(4);
vy = rv(5);
vz = rv(6);

R = norm([x y z]); % finding the length of the position vector from the origin, which is the center of the earth.

ax = -mu*x/R^3*(1 +  1.5* J2 * (Re/R)^2*(1-5*(z/R)^2)); % rate equations written along with J2 propagator constant
ay = -mu*y/R^3*(1 +  1.5* J2 * (Re/R)^2*(1-5*(z/R)^2)); 
az = -mu*z/R^3*(1 +  1.5* J2 * (Re/R)^2*(3-5*(z/R)^2)); 

dxdt = [vx, vy, vz, ax, ay, az]'; % this vector dxdt is returned to the ode45 function when @rate is called
end
