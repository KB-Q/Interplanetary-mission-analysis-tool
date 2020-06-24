function dydt=orb(t,rv)
 mu = 398600
 J2 = 1.08263591e-3;
 Re = 6378.137;
 x=rv(1);
 y=rv(2);
 z=rv(3);
 vx=rv(4);
 vy=rv(5);
 vz=rv(6);
 r=norm([x y z]);
 ax = -mu*x/r^3%*(1 + (3/2) * J2 * (Re/r)^2*(1-5*(z/r)^2));
 ay = -mu*y/r^3%*(1 +  1.5  * J2 * (Re/r)^2*(1-5*(z/r)^2));
 az = -mu*z/r^3%*(1 +  1.5  * J2 * (Re/r)^2*(3-5*(z/r)^2));
 dydt=[vx;vy;vz;ax;ay;az]
end
