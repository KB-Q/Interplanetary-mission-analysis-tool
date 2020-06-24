 
%--------------------------------------------------------------------------
% inputs:
%     a     semi-major axis [m]
%     ecc   eccentricity
%     inc   inclination [deg]
%     omasc right-ascension of the ascending node [deg]
%     omper argument of perigee [deg]
%     anom  time since perigee [s] or true/mean/eccentric anomaly [deg]
%     tag   string-tag: 'time', 'true' (default), 'mean' or 'eccentric'
% 
% output:
%     Y     state vector (position[m], velocity[m/s])
%
%--------------------------------------------------------------------------
function Y = kep2cart(a,ecc,inc,omasc,omper,anom,tag)
 
anom = anom(:);
if (nargin < 7)
    tag = 'true';
end
tag = lower(tag(1:3));
GM  = 3.986004418e14;
n   = sqrt(GM./a.^3);
 
if strcmp(tag,'tim')
    M = n.*anom;
    E = kepler(M,ecc,1e-10);
elseif strcmp(tag,'tru')
    f = anom/180*pi;
    E = atan2(sqrt(1-ecc.^2).*sin(f),ecc+cos(f));
elseif strcmp(tag,'ecc')
    E = anom/180*pi;
elseif strcmp(tag,'mea')
    E = kepler(anom/180*pi,ecc,1e-10);
else
    error('Undefined anomaly-type TAG.')
end
 
pos = [a.*(cos(E)-ecc), a.*sqrt(1-ecc.^2).*sin(E), zeros(size(anom))];
vel = [-sin(E), sqrt(1-ecc.^2).*cos(E), zeros(size(anom))];
vel = vel .* ( (n.*a./(1-ecc.*cos(E)))*[1 1 1] );
 
pos = rot(pos,-omper,3);
pos = rot(pos,-inc,1);
pos = rot(pos,-omasc,3);
vel = rot(vel,-omper,3);
vel = rot(vel,-inc,1);
vel = rot(vel,-omasc,3);
 
Y = [pos,vel]';
 
end
 
