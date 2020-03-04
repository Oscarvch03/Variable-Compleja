% Circulos
clc

r = 0.5;
r2 = 0.1;
xc = 0;
yc = 0;
theta = linspace(0,2*pi, 400);
X = [];
Y = [];
for i = 1:5
    % genero u circulo
    x = r*cos(theta) + xc;
    y = r*sin(theta) + yc;
    
    % sobre el anterior circulo hago mas circulos
    for j = 1:20:length(x)
        x1 = r2*cos(theta) + x(j);
        y1 = r2*sin(theta) + y(j);
        X(length(X)+1) = NaN;
        Y(length(Y)+1) = NaN;
        X = horzcat(X, x1);
        Y = horzcat(Y, y1);
    end    
    r = r + 0.2;
end

r = 2;
r2 = 0.5;
xc = 0;
yc = 0;
x = r*cos(theta) + xc;
y = r*sin(theta) + yc;

for k = 1:25:length(x)
    x1 = r2*cos(theta) + x(k);
    y1 = r2*sin(theta) + y(k);

    X(length(X)+1) = NaN;
    Y(length(Y)+1) = NaN;

    X = horzcat(X, x1);
    Y = horzcat(Y, y1);
end

%

Z = complex(X, Y);

X1 = 2.*real(Z)./((abs(Z).^2)+1);
X2 = 2.*imag(Z)./((abs(Z).^2)+1);
X3 = ((abs(Z).^2)-1)./((abs(Z).^2)+1);

figure
plot(X, Y, 'r')
figure
[a,b,c] = sphere(50);
colormap winter
mesh(a, b, c)
hold on
plot3(X1, X2, X3, 'r')
axis equal
