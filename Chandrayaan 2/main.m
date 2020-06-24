clear all;
mm=7.342e22;
rm=1737.1;
G = 6.6742e-20;
m1 = 5.974e24;
Re = 6378.137;
i=0*(pi/180);
argp=0*(pi/180);
dem=384400;  %earth and moon distance

%orbit distance from earth and moon respectively

or1=[230,45163];
or2=[251,54829];
or3=[276,71792];
or4=[277,89472];
or5=[276,142975];
or6=[266,413623];
or1m=[2000,33810];
or2m=[114,18072];
or3m=[118,4412];
or4m=[179,1412];
or5m=[124,164];
or6m=[119,127];
or7m=[2000,25316];
or8m=[114,25316]

%finding eccentricity and semi-major axis for earth bound and moon bound
[e1,a1]=ecc(or1);
[e2,a2]=ecc(or2);
[e3,a3]=ecc(or3);
[e4,a4]=ecc(or4);
[e5,a5]=ecc(or5);
[e6,a6]=ecc(or6);
[e1m,a1m]=eccmoon(or1m);
[e2m,a2m]=eccmoon(or2m);
[e3m,a3m]=eccmoon(or3m);
[e4m,a4m]=eccmoon(or4m);
[e5m,a5m]=eccmoon(or5m);
[e6m,a6m]=eccmoon(or6m);
[e7m,a7m]=eccmoon(or7m);
[e8m,a8m]=eccmoon(or8m);

% coe=[a,e,RA,i,argp,TA]
coe1= [a1, e1, 0, i, argp, 0];
coe2= [a2, e2, 0, i, argp, 0];
coe3= [a3, e3, 0, i, argp, 0];
coe4= [a4, e4, 0, i, argp, 0];
coe5= [a5, e5, 0, i, argp, 0];
coe6= [a6, e6, 0, i, argp, 0];

coe1m= [a1m, e1m, 0, i, argp, 0];
coe2m= [a2m, e2m, 0, i, argp, 0];
coe3m= [a3m, e3m, 0, i, argp, 0];
coe4m= [a4m, e4m, 0, i, argp, 0];
coe5m= [a5m, e5m, 0, i, argp, 0];
coe6m= [a6m, e6m, 0, i, argp, 0];
coe7m= [a7m, e7m, 0, i, argp, 0];
coe8m= [a8m, e8m, 0, i, argp, 0];

%time scale for earth and moon orbits 
dt=300;
dtm=300;

%calculating r and v for earth orbits and time periods 
[r1 v1]=sv_from_coe(coe1);
rv1=[r1 v1];
T1=((2*pi)*(a1^1.5))/((G*m1)^0.5);
t1=0:dt:T1;
[r2 v2]=sv_from_coe(coe2);
rv2=[r2 v2];
T2=((2*pi)*(a2^1.5))/((G*m1)^0.5);
t2=0:dt:T2;
[r3 v3]=sv_from_coe(coe3);
rv3=[r3 v3];
T3=((2*pi)*(a3^1.5))/((G*m1)^0.5);
t3=0:dt:T3;
[r4 v4]=sv_from_coe(coe4);
rv4=[r4 v4];
T4=((2*pi)*(a4^1.5))/((G*m1)^0.5);
t4=0:dt:T4;
[r5 v5]=sv_from_coe(coe5);
rv5=[r5 v5];
T5=((2*pi)*(a5^1.5))/((G*m1)^0.5);
t5=0:dt:T5;
[r6 v6]=sv_from_coe(coe6);
rv6=[r6 v6];
T6=((2*pi)*(a6^1.5))/((G*m1)^0.5);
t6=0:dt:T6;

%calculating time periods and r v for moon bound orbits
T1m=((2*pi)*(a1m^1.5))/((G*mm)^0.5);
t1m=0:dtm:T1m;
T2m=((2*pi)*(a2m^1.5))/((G*mm)^0.5);
t2m=0:dtm:T2m;
T3m=((2*pi)*(a3m^1.5))/((G*mm)^0.5);
t3m=0:dtm:T3m;
T4m=((2*pi)*(a4m^1.5))/((G*mm)^0.5);
t4m=0:dtm:T4m;
T5m=((2*pi)*(a5m^1.5))/((G*mm)^0.5);
t5m=0:dtm:T5m;
T6m=((2*pi)*(a6m^1.5))/((G*mm)^0.5);
t6m=0:dtm:T6m;
T6m=((2*pi)*(a6m^1.5))/((G*mm)^0.5);
t6m=0:dtm:T6m;
T7m=((2*pi)*(a7m^1.5))/((G*mm)^0.5);
t7m=0:dtm:T7m;
T8m=((2*pi)*(a8m^1.5))/((G*mm)^0.5);
t8m=0:dtm:T8m;
[r1m v1m]=sv_from_coemoond(coe1m);
rv1m=[r1m v1m];
[r2m v2m]=sv_from_coemoond(coe2m);
rv2m=[r2m v2m];
[r3m v3m]=sv_from_coemoond(coe3m);
rv3m=[r3m v3m];
[r4m v4m]=sv_from_coemoond(coe4m);
rv4m=[r4m v4m];
[r5m v5m]=sv_from_coemoond(coe5m);
rv5m=[r5m v5m];
[r6m v6m]=sv_from_coemoond(coe6m);
rv6m=[r6m v6m];
[r7m v7m]=sv_from_coemoond(coe7m);
rv7m=[r7m v7m];
[r8m v8m]=sv_from_coemoond(coe8m);
rv8m=[r8m v8m];

%tolerance parameters
opt = odeset('RelTol',1e-6,'AbsTol',1e-6);

%solving diff eqn for earth part
pos1=ode45(@orb,t1,rv1,opt);
post1=deval(pos1,t1);
pos2=ode45(@orb,t2,rv2,opt);
post2=deval(pos2,t2);
pos3=ode45(@orb,t3,rv3,opt);
post3=deval(pos3,t3);
pos4=ode45(@orb,t4,rv4,opt);
post4=deval(pos4,t4);
pos5=ode45(@orb,t5,rv5,opt);
post5=deval(pos5,t5);
pos6=ode45(@orb,t6,rv6,opt);
post6=deval(pos6,t6);
or1m=deval(pos1,T1/2);
or2m=deval(pos2,T2/2);
or3m=deval(pos3,T3/2);
or4m=deval(pos4,T4/2);
or5m=deval(pos5,T5/2);
%or6m=deval(pos6,T6/2);

%solving diff for moon part
pos1m=ode45(@orbmoond,t1m,rv1m,opt);
post1m=deval(pos1m,t1m);
pos2m=ode45(@orbmoond,t2m,rv2m,opt);
post2m=deval(pos2m,t2m);
pos3m=ode45(@orbmoond,t3m,rv3m,opt);
post3m=deval(pos3m,t3m);
pos4m=ode45(@orbmoond,t4m,rv4m,opt);
post4m=deval(pos4m,t4m);
pos5m=ode45(@orbmoond,t5m,rv5m,opt);
post5m=deval(pos5m,t5m);
pos6m=ode45(@orbmoond,t6m,rv6m,opt);
post6m=deval(pos6m,t6m);
pos7m=ode45(@orbmoond,t7m,rv7m,opt);
post7m=deval(pos7m,t7m);
pos8m=ode45(@orbmoond,t8m,rv8m,opt);
post8m=deval(pos8m,t8m);
while 1
    chand2(post1,post2,post3,post4,post5,post6,dt,post1m,post2m,post3m,post4m,post5m,post6m,post7m,post8m,dtm,or1m,or2m,or3m,or4m,or5m,or6m);
    hold off;
    %plot([0,0,0])
end
