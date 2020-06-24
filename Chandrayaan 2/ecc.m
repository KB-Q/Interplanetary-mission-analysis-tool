function [e,a]=ecc(d)
Re = 6378.137;
e=1-((2*(Re+d(1)))/(2*Re+(d(1)+d(2))));
a=(Re+((d(1)+d(2))/2));
