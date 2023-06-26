function [result] = func_d1(a, tabela)
  c = 1;
  soma = 0;
  while c <= 100
    t = tabela(c,1);
    y = tabela(c,2);
    sig = sigmoid(a*t);
    dg = (t * sig) * (1 - sig);
    soma = soma + 2 * (sig - y) * dg;
    c = c + 1;
  end
  result = soma;
end
