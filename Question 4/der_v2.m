 function [v2] = der_v2(p1, p2, p3, m1, m3)
   G = 9.8;
   v2 = (-G * m1 * ((p2 - p1) / ((norm(p2 - p1))^3 ))) - (G * m3 * ((p2 - p3) / ((norm(p2 - p3))^3 )));
   return;
 end
