% Punto 2: Escala de Grises (0:255) Transformacion 2

clc

% Matriz de constantes (Colores 0-255)
m = linspace(0, 255, 256);
C = ones(length(m), 1) * m;

figure 
imagesc(C)
title("Imagen Original")
axis off
colormap gray
saveas(gcf, 'p1_p2_Im_Or.png')

% Creamos la malla compleja (Coordenadas) asociada a la imagen anterior
Mc = Malla_Compleja(C); 

% Definimos la Transformacion ZT = Z .* exp(1i * theta)
T = @(Z, theta) Z .* exp(1i * theta);
% theta puede tomar valores en el intervalo (-2*pi, 2*pi)

% Aplicamos la Transformacion de Coordenadas
th = pi;
Mc_rot = T(Mc, th);

% Graficamos la Imagen Transformada
Graficar(C, Mc_rot, "Imagen Transformada: ZT = Z .* exp(1i * theta)", 'p2_Im_Trans.png');

% Verificamos la Inversa
T_INV = @(Z, theta) Z .* exp(-1i * theta);
Mc_inv = T_INV(Mc_rot, th);
Graficar(C, Mc_inv, "Inversa Imagen Transformada con: ZT = Z .* exp(-1i * theta)", 'p2_Im_Trans_Inv.png');

