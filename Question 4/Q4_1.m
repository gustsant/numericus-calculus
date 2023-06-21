## Script para resolução da questão 4
##
m1 = 10;
m2 = 20;
m3 = 30;

p1 = [-1;1];
p2 = [0;0.001];
p3 = [1;1];

v1 = [0;0];
v2 = [0;0];
v3 = [0;0];

h = 0.005;
cont = 0;
lim = 30;

hist_p1 = zeros([30 2]);
hist_p2 = zeros([30 2]);
hist_p3 = zeros([30 2]);
hist_temp = zeros([30 1]);

while cont < lim
  # Calculando o próximo valor dos v
  dv1 = der_v1(p1, p2, p3, m2, m3);
  v1 = v1 + h * dv1;

  dv2 = der_v2(p1, p2, p3, m1, m3);
  v2 = v2 + h * dv2;

  dv3 = der_v3(p1, p2, p3, m2, m1);
  v3 = v3 + h * dv3;

  # Calculando o próximo valor dos p
  p1 = p1 + h * v1;

  p2 = p2 + h * v2;

  p3 = p3 + h * v3;

  # Guardando esses valores para o gráfico
  hist_p1(cont + 1, 1) = p1(1); # x
  hist_p1(cont + 1, 2) = p1(2); # y

  hist_p2(cont + 1, 1) = p2(1);
  hist_p2(cont + 1, 2) = p2(2);

  hist_p3(cont + 1, 1) = p3(1);
  hist_p3(cont + 1, 2) = p3(2);

  hist_temp(cont + 1) = cont;

  # Avançando na iteração
  cont = cont + 1;
end

% Exibição dos resultados
disp('p1 = [');
disp(p1);
disp(']');

disp('p2 = [');
disp(p2);
disp(']');

disp('p3 = [');
disp(p3);
disp(']');

# Plotando os gráficos
plot(hist_p1(:,1),hist_p1(:,2),hist_p2(:,1),hist_p2(:,2),hist_p3(:,1),hist_p3(:,2));

