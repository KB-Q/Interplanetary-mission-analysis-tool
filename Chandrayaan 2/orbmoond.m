function dydt=orbmoond(t,rv)
 G = 6.6742e-20;
 mm=7.342e22;
 mu=G*mm;
 rm=1737.1;
 dem=384400;
 x=rv(1);
 y=rv(2);
 z=rv(3);
 vx=rv(4);
 vy=rv(5);
 vz=rv(6);
 r=norm([(x+dem) y z]);
 ax = -mu*(x+dem)/r^3;
 ay = -mu*y/r^3;
 az = -mu*z/r^3;
 dydt=[vx;vy;vz;ax;ay;az]
end
