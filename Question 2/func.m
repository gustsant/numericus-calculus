function [result] = func(a, tabela)
  c = 1;
  soma = 0;
  while c <= 100
    soma = (soma + (sigmoid(a * tabela(c,1)) - tabela(c,2) )^2);
    c = c + 1;
  end
  result = soma;
end
