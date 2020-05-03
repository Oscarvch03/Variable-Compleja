clc

% Imagen para Transformar
juve = imread('juve.jpg'); % Escudo de Equipo Juventus
juve_I = juve(:, :, 1); % Solo tomo una capa

figure
imagesc(juve_I)
title("Imagen Original")
axis off
colormap gray
saveas(gcf, 'p3_Im_Or.png')

% Creamos la malla compleja (Coordenadas) asociada a la imagen anterior
Mc = Malla_Compleja(juve_I);


%%%% a) Transformacion:  Z = X + iY, ZT = exp(Z)

% Definimos la Transformacion ZT = exp(Z)
T1 = @(Z) exp(Z);

% Aplicamos la Transformacion de Coordenadas
Mc_exp = T1(Mc);

% Graficamos la Imagen Transformada
Graficar(juve_I, Mc_exp, "Imagen Transformada: ZT = exp(Z)", 'p3_Im_Trans_exp.png');

% Verificamos la Inversa 
T_INV = @(Z) log(Z);
Mc_inv = T_INV(Mc_exp);
Graficar(juve_I, Mc_inv, "Inversa Imagen Transformada: ZT = Ln(Z)", 'p3_Im_Trans_Inv_log.png');


%%%% b) Transformacion: Rotacion theta radianes, Z = X + iY
%                       ZT = Z * exp(1i*theta)
%                       theta > 0, Rotacion a la Izq
%                       theta < 0, Rotacion a la Der

% Definimos la Transformacion ZT = Z .* exp(1i * theta)
T2 = @(Z, theta) Z .* exp(1i * theta);

% Aplicamos la Transformacion de Coordenadas
th = pi/4;
Mc_rot = T2(Mc, th);

% Graficamos la Imagen Transformada
Graficar(juve_I, Mc_rot, {'Imagen Transformada con Rotacion: ZT = Z .* exp(1i * theta)'; 'theta = pi/4'}, 'p3_Im_Trans_rot.png');

% Verificamos la Inversa
T_INV = @(Z, theta) Z .* exp(-1i * theta);
Mc_inv = T_INV(Mc_rot, th);
Graficar(juve_I, Mc_inv, {'Inversa Imagen Transformada con Rotacion: ZT = Z .* exp(-1i * theta)'; 'theta = pi/4'}, 'p3_Im_Trans_Inv_rot.png');

