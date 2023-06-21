## Função que retorna 1 para matriz diagonal dominante
##
function [b] = dia_est_dom(A)
    n = length(A);
    b = 1;
    for i = 1:n
        %A = abs(A(i,i));
        B = 0;
        for j = 1:n
            if j ~= i
                B = B + abs(A(i,j));
            end
        end
        if abs(A(i,i)) <= B
            b = 0;
            return;
        end
    end
end
