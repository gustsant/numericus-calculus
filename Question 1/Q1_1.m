## Script para resolução da questão 1, item 1
##
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
d = inv(D) * b;

% Convergencia
Raio_Espec = max(abs(eig(B)));    % Raio espectral
Diag_Dom = dia_est_dom(B);   % Diagonal dominante

% Exibição dos resultados
B
d
if Raio_Espec < 1
  disp('O algoritmo convergirá pelo raio espectral :)');
elseif Diag_Dom == 1
  disp('O algoritmo convergirá por ser diagonal dominante :)');
else
  disp('O algoritmo não convergirá :( ');
end




