function [result] = func_d2(a, tabela)
  c = 1;
  soma = 0;
  while c <= 100
    t = tabela(c,1);
    y = tabela(c,2);
    sig = sigmoid(a*t);
    dg = (t * sig) * (1 - sig);
    dg2 = (t^2) * (sig) *(1 - sig) * (1 - 2*sig);
    soma = soma + (2*(dg^2) + (2 * (sig - y)) * dg2);
    c = c + 1;
  end
  result = soma;
end
