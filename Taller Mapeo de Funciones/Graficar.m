function Graficar(Img, Mc_Trans, titulo, nombre_salida)
    % Img es la Matriz de la Imagen en Escala de Grises
    % Mc_Trans es la Matriz de Coordenadas Transformadas
    % titulo, es el titulo que se va a usar para graficar
    % nombre_salida, es el nombre con el que se guarda la imagen graficada

    % Coordenadas a Graficar
    re = real(Mc_Trans);
    im = imag(Mc_Trans);

    % Transformamos las matrices de coordenadas y de color en vectores 
    % para facilitar la forma de graficar
    X = reshape(re, 1, []); 
    Y = reshape(im, 1, []);
    C = reshape(Img, 1, []);

    % Graficamos las Coordenadas Transformadas teniendo en cuenta
    % el color asignado
    figure
    scatter(X, Y, 20, C, 'filled')
    set(gca, 'Color', 'g')
    title(titulo)
    axis off
    colormap gray
    saveas(gcf, nombre_salida)
end

