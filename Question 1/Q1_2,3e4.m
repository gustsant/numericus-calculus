%% Script para resolução da questão 1, itens 2,3 e 4
%%
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
A = (1 - y * k) * eye(9) - y * (1 - k) * T';
b = k * r + (1 - k) * T' * r;

% Calcular D (matriz que contém a diagonal de A)
D = diag(diag(A));

% Calcular L (matriz diagonal inferior, sem a diagonal)
L = tril(A, -1);

% Calcular U (matriz diagonal superior, sem a diagonal)
U = triu(A, 1);

xo = [0;0;0;0;0;0;0;0;0];
maxit = 5;

[xj, kj, iter1, x_kj] = jacobi(A, b, D, L, U, xo, maxit);
[xs, ks, iter2, x_ks] = seidel(A, b, D, L, U, xo, maxit);

% Plotando o gráfico
pos = [0;1;2;3;4];
plot(pos,iter1,'-o');
hold on;
plot(pos,iter2,'-o');
xlabel('Posição');
ylabel('Iterações');
title('Curvas da erro');
legend('Jacobi', 'Seidel');

% Exibição dos resultados
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

