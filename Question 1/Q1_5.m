## Script para resolução da questão 1, item 5
##
T = eye(9);

r = [2;1;0;1;0;0;0;0;5];

y = 0.5;
k = 0.5;

#A e b
A = (1 - y*k) * eye(9) - y * (1 - k) * T';
b = k * r + (1 - k) * T' * r;

% Calcular D (matriz que contém a diagonal de A)
D = diag(diag(A));

% Calcular L (matriz diagonal inferior, sem a diagonal)
L = tril(A, -1);

% Calcular U (matriz diagonal superior, sem a diagonal)
U = triu(A, 1);

B = -1 * inv(D) * (L + U);
d = inv(D) * b;

xo = [0;0;0;0;0;0;0;0;0];
maxit = 5;

[xj, kj] = jacobi(A, b, D, L, U, xo, maxit);

% Exibição dos resultados
B
d

fprintf('Solução do sistema para T identidade:\n  x = ');
fprintf('%f  ', xj);
fprintf('\n');
fprintf('Em %d iterações \n\n', kj);

x_otimo = linsolve(A, b);
fprintf('Solução ótima:\n x* = ');
fprintf('%f  ', x_otimo);
fprintf('\n\n');


