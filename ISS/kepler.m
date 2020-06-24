 
%--------------------------------------------------------------------------
% inputs:
%     mm  - mean anomaly [rad]  - matrix
%     ecc - eccentricity        - matrix
%     tol - tolerance level (def: 1e-10)
% 
% outputs:
%     ee  - eccentric anomaly [rad]
%     itr - number of iterations (optional)
%
%--------------------------------------------------------------------------
function [ee,itr] = kepler(mm,ecc,tol)
 
if (nargin<3)
    tol = 1e-10;
end
if ( isempty(tol) )
    error('TOL should be scalar')
end
if ( any(ecc(:) >= 1) || any(ecc(:) < 0) )
   error('Non-valid eccentricity')
end
maxitr = 20;
 
mm    = rem(mm,2*pi);
eeold = mm;
eenew = eeold + ecc.*sin(eeold);
itr   = 0;
 
while ( any(any(abs(eenew-eeold)>tol)) && (itr<maxitr) )
    itr   = itr + 1;
    eeold = eenew;
    fold  = (eeold-ecc.*sin(eeold)-mm);
    fpold = (1-ecc.*cos(eeold));
    eenew = eeold - fold./fpold;
end
 
if ( (itr == maxitr) && (any(any(abs(eenew-eeold)>tol))) )
   error('KEPLER didn''t achieve convergence within 20 iterations')
else
   ee = eenew;
end
 
end
 
