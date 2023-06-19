T = [0,0,0,0,0,0,0,0,0;
     1,0,0,0,0,0,0,0,0;
     0,1,0,0,0,0,0,0,0;
     0,0,0,0,1,0,0,0,0;
     0,0,0,1,0,0,0,0,0;
     0,0,1,0,0,0,0,0,0;
     0,0,0,0,0,1,0,0,0;
     0,0,0,0,0,0,1,0,0;
     0,0,0,0,0,0,0,1,1];

r = [2;1;0;1;0;0;0;0;5];

y = 0.5;
k = 0.5;

% Ax = b
A = (1 - y*k)*eye(9) - y*(1 - k)*T';
b = (k + (1 - k)*T')*r;

% x = Bx + d
% Calcular D (matriz que contém a diagonal de A)
D = diag(diag(A));

% Calcular L (matriz diagonal inferior, sem a diagonal)
L = tril(A, -1);

% Calcular U (matriz diagonal superior, sem a diagonal)
U = triu(A, 1);

B = -1*inv(D)*(L + U);

% Convergencia
Raio_Espec = abs(eig(B));    % Raio espectral
Diag_Dom = dia_est_dom(B);   % Diagonal dominante

if Raio_Espec < 1 || Diag_Dom == 1
  disp('O algoritmo convergirá :)');
else
  disp('O algoritmo não convergirá :( ');
end




