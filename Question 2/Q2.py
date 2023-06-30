## Script para resolução da questão 2
##
import numpy as np
""" import matplotlib as mpl
mpl.use('pgf') """
import matplotlib.pyplot as plt

def sigmoid(z):
    return 1 / (1 + np.exp(-np.clip(z, -709, 709)))

def func(a, tabela):
    soma = 0
    for c in range(len(tabela)):
        soma += (sigmoid(a * tabela[c, 0]) - tabela[c, 1]) ** 2
    return soma

def func_d1(a, tabela):
    soma = 0
    for c in range(len(tabela)):
        t = tabela[c, 0]
        y = tabela[c, 1]
        sig = sigmoid(a * t)
        dg = t * sig * (1 - sig)
        soma += 2 * (sig - y) * dg
    return soma

def func_d2(a, tabela):
    soma = 0
    for c in range(len(tabela)):
        t = tabela[c, 0]
        y = tabela[c, 1]
        sig = sigmoid(a * t)
        dg = t * sig * (1 - sig)
        dg2 = (t ** 2) * sig * (1 - sig) * (1 - 2 * sig)
        soma += 2 * (dg ** 2) + 2 * (sig - y) * dg2
    return soma

def minimize(x, erro, alfa, tabela):
    hist_a = np.zeros(51)
    hist_f = np.zeros(51)
    tempo = np.zeros(51)
    iter = 0
    v = 0
    while (abs(func_d1(x, tabela)) > erro) or (iter <= 50):
        if func_d2(x, tabela) > 0:
            v = -(func_d1(x, tabela) / func_d2(x, tabela))
        else:
            v = -func_d1(x, tabela)
        while func(x + v, tabela) > (func(x, tabela) + alfa * func_d1(x, tabela) * v):
            v = v / 2
        x = x + v
        iter += 1
        hist_f[iter-1] = func(x, tabela)
        hist_a[iter-1] = x
        tempo[iter-1] = iter
    return x, iter, hist_a, hist_f, tempo

def set_size(width_pt, fraction=1, subplots=(1, 1)):
    
    # Width of figure (in pts)
    fig_width_pt = width_pt * fraction
    # Convert from pt to inches
    inches_per_pt = 1 / 72.27

    # Golden ratio to set aesthetic figure height
    golden_ratio = (5**.5 - 1) / 2

    # Figure width in inches
    fig_width_in = fig_width_pt * inches_per_pt
    # Figure height in inches
    fig_height_in = fig_width_in * golden_ratio * (subplots[0] / subplots[1])
    return (fig_width_in, fig_height_in)

tabela = np.array([
    [20, 0],
    [23, 0],
    [24, 0],
    [25, 0],
    [25, 1],
    [26, 0],
    [26, 0],
    [28, 0],
    [28, 0],
    [29, 0],
    [30, 0],
    [30, 0],
    [30, 0],
    [30, 0],
    [30, 0],
    [30, 1],
    [32, 0],
    [32, 0],
    [33, 0],
    [33, 0],
    [34, 0],
    [34, 0],
    [34, 1],
    [34, 0],
    [34, 0],
    [35, 0],
    [35, 0],
    [36, 0],
    [36, 1],
    [36, 0],
    [37, 0],
    [37, 1],
    [37, 0],
    [38, 0],
    [38, 0],
    [39, 0],
    [39, 1],
    [40, 0],
    [40, 1],
    [41, 0],
    [41, 0],
    [42, 0],
    [42, 0],
    [42, 0],
    [42, 1],
    [43, 0],
    [43, 0],
    [43, 1],
    [44, 0],
    [44, 0],
    [44, 1],
    [44, 1],
    [45, 0],
    [45, 1],
    [46, 0],
    [46, 1],
    [47, 0],
    [47, 0],
    [47, 1],
    [48, 0],
    [48, 1],
    [48, 1],
    [49, 0],
    [49, 0],
    [49, 1],
    [50, 0],
    [50, 1],
    [51, 0],
    [52, 0],
    [52, 1],
    [53, 1],
    [53, 1],
    [54, 1],
    [55, 0],
    [55, 1],
    [55, 1],
    [56, 1],
    [56, 1],
    [56, 1],
    [57, 0],
    [57, 0],
    [57, 1],
    [57, 1],
    [57, 1],
    [57, 1],
    [58, 0],
    [58, 1],
    [58, 1],
    [59, 1],
    [59, 1],
    [60, 0],
    [60, 1],
    [61, 1],
    [62, 1],
    [62, 1],
    [63, 1],
    [64, 0],
    [64, 1],
    [65, 1],
    [69, 1]
])

x = 0.5
erro = 1e-6
alfa = 0.5

## Descomentar para solução do item 2
""" media = np.mean(tabela[:, 0])                           # Calculando a média da primeira coluna
tabela[:, 0] = tabela[:, 0].astype(np.float64) - media  # Subtraindo a média de cada elemento da primeira coluna """

x, iter, hist_a, hist_f, tempo = minimize(x, erro, alfa, tabela)
print(x)
""" plt.rcParams.update({
        "font.family": "serif",  # use serif/main font for text elements
        "text.usetex": True,     # use inline math for ticks
        "pgf.rcfonts": False     # don't setup fonts from rc parameters
        }) """

idades = tabela[:, 0]
medias = np.zeros(idades.shape)

for i in range(len(idades)):
    idade = idades[i]
    numeros = tabela[idades == idade, 1]
    medias[i] = np.mean(numeros)

plt.subplots(1, 1, figsize=set_size(460))
plt.grid(True)
plt.xlabel('Idade')
plt.ylabel('Média de DC / Valor da função')
plt.title('Média de DC para cada idade')

final_a = hist_a[-1]
x = np.arange(min(idades), max(idades) + 1)
y = 1 / (1 + np.exp(-final_a * x))
y = sigmoid(final_a * x)

plt.plot(x, y, color='#068070', linewidth=1)
plt.plot(idades, medias, "o", color='#B30053', markersize=3)
plt.legend(['Média de DC', '$1 / (1 + e^{-ax})$'], loc='best')

#plt.savefig('q2_g6.pgf', format='pgf')
plt.show()

plt.subplots(1, 1, figsize=set_size(460))
plt.grid(True, color='gray', linewidth=0.2, axis='y')
plt.plot(tempo[:iter], hist_f[:iter], 'o-', color='#068070', linewidth=0.7, markersize=1.5)
plt.xlabel('Iteração')
plt.ylabel('$f(a)$')
#068070#E85F10
plt.xticks(np.arange(1, iter + 1, 2))
#plt.savefig('q2_g1.pgf', format='pgf')
plt.show()

plt.subplots(1, 1, figsize=set_size(460))
plt.grid(True, color='gray', linewidth=0.2, axis='y')
plt.plot(tempo[:iter], hist_a[:iter], 'o-', color='#B30053', linewidth=0.7, markersize=1.5)
plt.xlabel('Iteração')
plt.ylabel('$a$')
#B30053#09B5AF
plt.xticks(np.arange(1, iter + 1, 2))
#plt.savefig('q2_g2.pgf', format='pgf')
plt.show()
