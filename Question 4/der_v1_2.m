 function [v1] = der_v1_2(p1,p2,p3,m2,m3,k1)
   G = 9.8;
   v1 = (-G*m2*((p1-p2) / ((norm(p1-p2))^3 ))) - (G*m3*( (p1-p3) / ((norm(p1-p3))^3 )));
   v1 = v1 + k1;
   return;
 endfunction
