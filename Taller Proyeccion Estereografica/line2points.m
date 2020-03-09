%%% Funcion sugerida por Santiago Lopez
function [X, Y] = line2points(p1, p2)
    %%% Funcion para unir 2 puntos mediante una recta

    lambda = linspace(0, 1, 1000);
    for i = 1:length(lambda)
        X(i) = lambda(i)*(p1(1)) + (1-lambda(i))*p2(1);
        Y(i) = lambda(i)*(p1(2)) + (1-lambda(i))*p2(2);
    end
end