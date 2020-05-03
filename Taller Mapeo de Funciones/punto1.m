% Punto 1: Escala de Grises (0:255) Transformacion 1

clc

% Matriz de constantes (Colores 0-255)
m = linspace(0, 255, 256);
C = ones(length(m), 1) * m;

figure 
imagesc(C)
title("Imagen Original")
axis off
colormap gray
saveas(gcf, 'p1_p2_Im_Orig.png')

% Creamos la malla compleja (Coordenadas) asociada a la imagen anterior
Mc = Malla_Compleja(C); 

% Definimos la Transformacion ZT = e^(Z)
T = @(Z) exp(Z); 

% Aplicamos la Transformacion de Coordenadas
Mc_exp = T(Mc);

% Graficamos la Imagen Transformada
Graficar(C, Mc_exp, "Imagen Transformada: ZT = exp(Z)", 'p1_Im_Trans.png');

% Verificamos la Inversa 
T_INV = @(Z) log(Z);
Mc_inv = T_INV(Mc_exp);
Graficar(C, Mc_inv, "Inversa Imagen Transformada: ZT = Ln(Z)", 'p1_Im_Trans_Inv.png');

