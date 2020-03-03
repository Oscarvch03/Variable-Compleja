% Espiral
clc 
theta = linspace(0,10*pi, 400);
a = 0.2;

X = [];
Y = [];

x = a.*theta.*cos(theta);
y = a.*theta.*sin(theta);

X = horzcat(X, x);
Y = horzcat(Y, y);

% Para dibujar poligonos
n = 5;
r = 0.0005;
tita = (0:(4*pi/n):4*pi) + pi/2;
for i = 1:5:length(x)
    if(i > 20*5)
        r = 0.6;
    elseif(20*3 < i <= 20*5)
        r = 0.4;   
    end
    
    x1 = r.*cos(tita) + x(i);
    y1 = r.*sin(tita) + y(i);
    X(length(X)+1) = NaN;
    Y(length(Y)+1) = NaN;
    X = horzcat(X, x1);
    Y = horzcat(Y, y1);
end

plot(X, Y);
axis equal
