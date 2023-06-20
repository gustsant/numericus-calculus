 function [v3] = der_v3(p1,p2,p3,m2,m1)
   G = 9.8;
   v3 = (-G*m2*( (p3-p2) / ((norm(p3-p2))^3 ))) - (G*m1*( (p3-p1) / ((norm(p3-p1))^3 )));
   return;
 endfunction
