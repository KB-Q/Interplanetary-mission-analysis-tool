 
function xout = rot(xin,alfa,i)
 
[r,c] = size(xin);
if ( (r ~= 3) && (c ~= 3) )
    error('XIN should be Nx3 or 3xN matrix')
elseif c == 3
    dotransp = 0;
else
    xin = xin';
    dotransp = 1;
end 
 
nx = size(xin,1);
na = length(alfa);
 
if ( (na == 1) && (nx > 1) )
    alfa = alfa*ones(nx,1);
elseif ( (na > 1) && (nx == 1) )
    xin = xin(ones(na,1),:);
elseif na ~= nx
    error('ALFA and XIN don''t match')
end
 
c = cos(alfa(:)/180*pi);
s = sin(alfa(:)/180*pi);
x = xin(:,1);
y = xin(:,2);
z = xin(:,3);
 
if (i == 1)
    xout = [    x    ,  c.*y+s.*z, -s.*y+c.*z];
elseif (i == 2)
    xout = [c.*x-s.*z,     y     ,  s.*x+c.*z];
elseif (i == 3)
    xout = [c.*x+s.*y, -s.*x+c.*y,     z     ];
else
    error('Choose axis I = 1, 2, or 3')
end
 
if (dotransp)
    xout = xout';
end
 
end
 
