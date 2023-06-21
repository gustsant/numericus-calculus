## Algoritmo de Jacobi
##
function [x, k, iter1, x_kj] = jacobi(A, b, D, L, U, xo, maxit)
    k = 0;
    x_kj = cell(maxit, 1);
    iter1 = [0;0;0;0;0];
    x_otimo = linsolve(A,b);
    while k < maxit
        if isequal(A*xo, b)
            x = xo;
            return
        else
            B = -1 * inv(D) * (L + U);
            d = inv(D) * b;
            x = B * xo + d;
            xo = x;
            x_kj{k + 1} = xo;
            iter1(k + 1) = norm(xo - x_otimo);
            k = k + 1;
        end
    end
end

