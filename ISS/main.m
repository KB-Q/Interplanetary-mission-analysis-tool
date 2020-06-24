G = 6.6742e-20;
 
M = 5.974e24;
Re = 6378.137;
m2 = 1000;
 
ha=411;
hp=421;
 
a=6776;
e = 0.0005638;
 
i=69*(pi/180);
 
% RA=179.9984*(pi/180);
argp=112.9748*(pi/180);
 
% coe=[a,e,RA,i,omega,argp]
coe = [a, e, 2.0543, .9, 5.549, 0];
 
[r v]=sv_from_coe(coe);
rv=[r v];
 
t=0:6:60*60*24;
 
opt = odeset('RelTol',1e-6,'AbsTol',1e-6);
pos=ode45(@orb,t,rv, opt);
 
R=deval(pos,t);
orbitanimate2(R,t)
