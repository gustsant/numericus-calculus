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

% Calcula A e b
A = (1 - y*k)*eye(9) - y*(1 - k)*T';
b = (k + (1 - k)*T')*r;

% Calcular D (matriz que contém a diagonal de A)
D = diag(diag(A));

% Calcular L (matriz diagonal inferior, sem a diagonal)
L = tril(A, -1);

% Calcular U (matriz diagonal superior, sem a diagonal)
U = triu(A, 1);

xo = [0;0;0;0;0;0;0;0;0];
maxit = 5;

[xj, kj] = jacobi(A, b, D, L, U, xo, maxit);
[xs, ks] = seidel(A, b, D, L, U, xo, maxit);

fprintf('Solução do sistema por Jacobi:\n  x = ');
fprintf('%f  ', xj);
fprintf('\n');
fprintf('Em %d iterações \n\n', kj);

fprintf('Solução do sistema por Seidel:\n  x = ');
fprintf('%f  ', xs);
fprintf('\n');
fprintf('Em %d iterações \n\n', ks);

x_otimo = linsolve(A, b);
fprintf('Solução ótima:\n x* = ');
fprintf('%f  ', x_otimo);
fprintf('\n\n');

