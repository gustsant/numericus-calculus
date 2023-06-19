function [x, k] = jacobi(A, b, D, L, U, xo, maxit)
    k = 0;
    while k < maxit
        if isequal(A*xo, b)
            x = xo;
            return
        else
            B = -1*inv(D) * (L + U);
            d = inv(D) * b;
            x = B * xo + d;
            xo = x;
            k = k + 1;
        end
    end
end

