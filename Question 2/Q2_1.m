tabela = [20, 0;
          23, 0;
          24, 0;
          25, 0;
          25, 1;
          26, 0;
          26, 0;
          28, 0;
          28, 0;
          29, 0;
          30, 0;
          30, 0;
          30, 0;
          30, 0;
          30, 0;
          30, 1;
          32, 0;
          32, 0;
          33, 0;
          33, 0;
          34, 0;
          34, 0;
          34, 1;
          34, 0;
          34, 0;
          35, 0;
          35, 0;
          36, 0;
          36, 1;
          36, 0;
          37, 0;
          37, 1;
          37, 0;
          38, 0;
          38, 0;
          39, 0;
          39, 1;
          40, 0;
          40, 1;
          41, 0;
          41, 0;
          42, 0;
          42, 0;
          42, 0;
          42, 1;
          43, 0;
          43, 0;
          43, 1;
          44, 0;
          44, 0;
          44, 1;
          44, 1;
          45, 0;
          45, 1;
          46, 0;
          46, 1;
          47, 0;
          47, 0;
          47, 1;
          48, 0;
          48, 1;
          48, 1;
          49, 0;
          49, 0;
          49, 1;
          50, 0;
          50, 1;
          51, 0;
          52, 0;
          52, 1;
          53, 1;
          53, 1;
          54, 1;
          55, 0;
          55, 1;
          55, 1;
          56, 1;
          56, 1;
          56, 1;
          57, 0;
          57, 0;
          57, 1;
          57, 1;
          57, 1;
          57, 1;
          58, 0;
          58, 1;
          58, 1;
          59, 1;
          59, 1;
          60, 0;
          60, 1;
          61, 1;
          62, 1;
          62, 1;
          63, 1;
          64, 0;
          64, 1;
          65, 1;
          69, 1];
%%% Descomentar para resultados do item 2 (crtl+shift+r)
%%c = 1;
%%media = median(tabela(:,1));
%%
%%while c <= 100
%%  tabela(c,1) = tabela(c,1) - media;
%%  c = c + 1;
%%end
%%
%%median(tabela(:,1));

x = 0.5;
erro = 10^(-6);
alfa = 0.5;

[x, iter, hist_a, hist_f, tempo] = minimize(x, erro, alfa, tabela);

plot(tempo(1:iter), hist_f(1:iter));

