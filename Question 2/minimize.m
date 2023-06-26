function [x, iter, hist_a, hist_f, tempo] = minimize(x, erro, alfa, tabela)
  tempo = zeros(1, 50);
  hist_a = zeros(1, 50);
  hist_f = zeros(1, 50);
  iter = 0;
  v = 0;
  while (abs(func_d1(x, tabela)) > erro) && (iter <= 50)
    if func_d2(x, tabela) > 0
      v = -(func_d1(x, tabela) / func_d2(x, tabela));
    else
      v = -func_d1(x, tabela);
    end
    while func(x + v, tabela) > (func(x, tabela) + alfa * func_d1(x, tabela) * v)
      v = v / 2;
    end
    x = x + v;
    iter = iter + 1;
    hist_f(iter) = func(x, tabela);
    hist_a(iter) = x;
    tempo(iter) = iter;
  end
end
