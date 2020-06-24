function [e,a]=eccmoon(d)
rm=1737.1;
e=1-((2*(rm+d(1)))/(2*rm+(d(1)+d(2))));
a=(rm+((d(1)+d(2))/2));
