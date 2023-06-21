## Algoritmo de Seidel
##
function [x, k, iter2, x_ks] = seidel(A, b, D, L, U, xo, maxit)
    k = 0;
    x_ks = cell(maxit, 1);
    iter1 = [0;0;0;0;0];
    x_otimo = linsolve(A,b);
    while k < maxit
        if isequal(A*xo, b)
            x = xo;
            return
        else
            B = -1 * inv(D + L) * U;
            d = inv(D + L) * b;
            x = B * xo + d;
            xo = x;
            x_ks{k + 1} = xo;
            iter2(k + 1) = norm(xo - x_otimo);
            k = k + 1;
        end
    end
end

