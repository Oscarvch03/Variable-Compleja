% Espiral
clc 
theta = linspace(0,30*pi, 1200);
a = 0.2;

X = [];
Y = [];

x = a.*theta.*cos(theta);
y = a.*theta.*sin(theta);

X = horzcat(X, x);
Y = horzcat(Y, y);

% Para dibujar poligonos
n = 5;
r = 0.08;
tita = (0:(4*pi/n):4*pi) + pi/2;
for i = 1:5:length(x)
    if(i > 20*5)
        r = r;
    elseif(20*3 < i <= 20*5)
        r = r;   
    end
    
    x1 = r.*cos(tita) + x(i);
    y1 = r.*sin(tita) + y(i);
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
grid on
xlim([min(X) max(X)])
ylim([min(Y) max(Y)])
xlabel('Eje Real')
ylabel('Eje Imaginario')
title('Plano Complejo')
saveas(gcf, 'figure2PC.png');
figure
[a,b,c] = sphere(20);
colormap winter
plot3(a, b, c,'LineStyle','--','color',[0.8,0.8,0.8]);
hold on
grid on
plot3(X1, X2, X3, 'r')
xlim([-1 1])
ylim([-1 1])
zlim([-1 1])
xlabel('Coordenada X1')
ylabel('Coordenada X2')
zlabel('Coordenada X3')
title('Proyección Estereográfica')
saveas(gcf, 'figure2PE.png');
axis equal