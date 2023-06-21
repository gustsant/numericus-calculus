%teste decomposição cholesky

% Matriz relacionada às válvulas
A = [0.23, 0.08, 0.29, 0.16;
     0.93, 0.81, 0.63, 0.87;
     0.8, 0.19, 0.89, 0.54;
     0.81, 0.9, 0.32, 0.11;
     0.23, 0.43, 0.82, 0.86;
     0.01, 0.51, 0.42, 0.22;
     0.12, 0.34, 0.94, 0.32;
     0.52, 0.7, 0.36, 0.97;
     0.96, 0.25, 0.5, 0.3;
     0.28, 0.04, 0.61, 0.5];

% Vetores dos termos independentes
bliq = [9.18;
         35.27;
         28.87;
         24.09;
         27.66;
         14.99;
         23.84;
         26.43;
         22.41;
         17.29];

boil = [5.1;
        20.58;
        16.04;
        15.33;
        16.79;
        10.05;
        14.83;
        15.83;
        12.09;
        9.72];

bgas = [1.3;
        4.72;
        4.03;
        3.87;
        4.14;
        2.53;
        4.06;
        3.57;
        2.85;
        2.4];

% Transformação da matriz A em uma matriz quadrada
A_quad = A' * A;

% Decomposição
function [L] = decomposicao_L(A_quad)
    [nl, nc] = size(A_quad);
    L = zeros(nl, nc);
    det = 1;
    for j = 1:nl
        soma = 0;
        for k = 1:j-1
            soma = soma + A_quad(j,k)^2;
        end
        t = A_quad(j, j) - soma;
        if t > 0
            A_quad(j, j) = sqrt(t);
            L(j, j) = A_quad(j, j);
            r = 1 / A_quad(j, j);
            det = det * t;
        else
            disp('Matriz não definida positiva');
            return
        end
        for l = j+1:nl
            soma = 0;
            for k = 1:j-1
                soma = soma + A_quad(l, k) * A_quad(j, k);
            end
            A_quad(l, j) = (A_quad(l, j) - soma) * r;
            L(l, j) = A_quad(l, j);
        end
    end
end

% Função para substituições sucessivas
function [x] = Substituicoes_sucessivas(L, b)
    n = length(L);
    x = zeros(n, 1);
    x(1) = b(1) / L(1, 1);
    for i = 2:n
        x(i) = (b(i) - L(i, 1:i-1) * x(1:i-1)) / L(i, i);
    end
end

% Função para substituições retroativas
function [x] = Substituicoes_retroativas(U, b)
    n = length(U);
    x = zeros(n, 1);
    x(n) = b(n) / U(n, n);
    for i = n-1:-1:1
        x(i) = (b(i) - U(i, i+1:n) * x(i+1:n)) / U(i, i);
    end
end

% Resolução dos sistemas
[L] = decomposicao_L(A_quad);

yliq = Substituicoes_sucessivas(L, A' * bliq);
qliq = Substituicoes_retroativas(L', yliq);

yoil = Substituicoes_sucessivas(L, A' * boil);
qoil = Substituicoes_retroativas(L', yoil);

ygas = Substituicoes_sucessivas(L, A' * bgas);
qgas = Substituicoes_retroativas(L', ygas);


% Cálculo dos parâmetros bsw e gor
bsw = zeros(1,4);      % Cálculo de bsw
for j = 1:length(bsw)
    bsw(j) = (1 - (qoil(j) / qliq(j)));
end

gor = zeros(1,4);      % Cálculo de gor
for i = 1:length(gor)
    gor(i) = qgas(i) / qoil(i);
end

% Exibição dos resultados
disp('qliq = [');
disp(qliq);
disp(']');

disp('qoil = [');
disp(qoil);
disp(']');

disp('qgas = [');
disp(qgas);
disp(']');

disp('bsw = [');
disp(bsw);
disp(']');

disp('gor = [');
disp(gor);
disp(']');


