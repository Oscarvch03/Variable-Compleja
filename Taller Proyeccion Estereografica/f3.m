% Superficie Parametrica 1
clc
theta = linspace(-6,6, 1000);

X = [];
Y = [];

x = 2.5 .* (sin(-5 .* theta).^2) .* 2.^(cos(cos(4.28.*2.3.*theta)));
y = 2.5 .* sin(sin(-5.*theta)) .* (cos(4.28 .* 2.3 .* theta) .^2);

X = horzcat(X, x);
Y = horzcat(Y, y);

X(length(X)+1) = NaN;
Y(length(Y)+1) = NaN;

x1 = -1 .* x;
X = horzcat(X, x1);
Y = horzcat(Y, y);

X(length(X)+1) = NaN;
Y(length(Y)+1) = NaN;

X = horzcat(X, y);
Y = horzcat(Y, x1);

X(length(X)+1) = NaN;
Y(length(Y)+1) = NaN;

X = horzcat(X, y);
Y = horzcat(Y, x);


ymax = max(y);
for i = 1:length(y)
    if(y(i) == ymax)
        xymax = x(i);
        break;
    end
end

r = 0.3;
x1 = r*cos(theta) + xymax;
y1 = r*sin(theta) + ymax;
X(length(X)+1) = NaN;
Y(length(Y)+1) = NaN;
X = horzcat(X, x1);
Y = horzcat(Y, y1);

r = 0.5;
x1 = r*cos(theta) + xymax;
y1 = r*sin(theta) + ymax;
X(length(X)+1) = NaN;
Y(length(Y)+1) = NaN;
X = horzcat(X, x1);
Y = horzcat(Y, y1);

r = 0.3;
x1 = r*cos(theta) - xymax;
y1 = r*sin(theta) - ymax;
X(length(X)+1) = NaN;
Y(length(Y)+1) = NaN;
X = horzcat(X, x1);
Y = horzcat(Y, y1);

r = 0.5;
x1 = r*cos(theta) - xymax;
y1 = r*sin(theta) - ymax;
X(length(X)+1) = NaN;
Y(length(Y)+1) = NaN;
X = horzcat(X, x1);
Y = horzcat(Y, y1);

r = 0.3;
x1 = r*cos(theta) + xymax;
y1 = r*sin(theta) - ymax;
X(length(X)+1) = NaN;
Y(length(Y)+1) = NaN;
X = horzcat(X, x1);
Y = horzcat(Y, y1);

r = 0.5;
x1 = r*cos(theta) + xymax;
y1 = r*sin(theta) - ymax;
X(length(X)+1) = NaN;
Y(length(Y)+1) = NaN;
X = horzcat(X, x1);
Y = horzcat(Y, y1);

r = 0.3;
x1 = r*cos(theta) - xymax;
y1 = r*sin(theta) + ymax;
X(length(X)+1) = NaN;
Y(length(Y)+1) = NaN;
X = horzcat(X, x1);
Y = horzcat(Y, y1);

r = 0.5;
x1 = r*cos(theta) - xymax;
y1 = r*sin(theta) + ymax;
X(length(X)+1) = NaN;
Y(length(Y)+1) = NaN;
X = horzcat(X, x1);
Y = horzcat(Y, y1);

%

r = 0.3;
x1 = r*cos(theta) + ymax;
y1 = r*sin(theta) + xymax;
X(length(X)+1) = NaN;
Y(length(Y)+1) = NaN;
X = horzcat(X, x1);
Y = horzcat(Y, y1);

r = 0.5;
x1 = r*cos(theta) + ymax;
y1 = r*sin(theta) + xymax;
X(length(X)+1) = NaN;
Y(length(Y)+1) = NaN;
X = horzcat(X, x1);
Y = horzcat(Y, y1);

r = 0.3;
x1 = r*cos(theta) - ymax;
y1 = r*sin(theta) - xymax;
X(length(X)+1) = NaN;
Y(length(Y)+1) = NaN;
X = horzcat(X, x1);
Y = horzcat(Y, y1);

r = 0.5;
x1 = r*cos(theta) - ymax;
y1 = r*sin(theta) - xymax;
X(length(X)+1) = NaN;
Y(length(Y)+1) = NaN;
X = horzcat(X, x1);
Y = horzcat(Y, y1);

r = 0.3;
x1 = r*cos(theta) + ymax;
y1 = r*sin(theta) - xymax;
X(length(X)+1) = NaN;
Y(length(Y)+1) = NaN;
X = horzcat(X, x1);
Y = horzcat(Y, y1);

r = 0.5;
x1 = r*cos(theta) + ymax;
y1 = r*sin(theta) - xymax;
X(length(X)+1) = NaN;
Y(length(Y)+1) = NaN;
X = horzcat(X, x1);
Y = horzcat(Y, y1);

r = 0.3;
x1 = r*cos(theta) - ymax;
y1 = r*sin(theta) + xymax;
X(length(X)+1) = NaN;
Y(length(Y)+1) = NaN;
X = horzcat(X, x1);
Y = horzcat(Y, y1);

r = 0.5;
x1 = r*cos(theta) - ymax;
y1 = r*sin(theta) + xymax;
X(length(X)+1) = NaN;
Y(length(Y)+1) = NaN;
X = horzcat(X, x1);
Y = horzcat(Y, y1);

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
saveas(gcf, 'figure3PC.png');

figure
[a,b,c] = sphere(20);
colormap winter
plot3(a, b, c,'LineStyle','--','color',[0.8,0.8,0.8]);
grid on
hold on
plot3(X1, X2, X3, 'r')
xlim([-1 1])
ylim([-1 1])
zlim([-1 1])
xlabel('Coordenada X1')
ylabel('Coordenada X2')
zlabel('Coordenada X3')
title('Proyección Estereográfica')
saveas(gcf, 'figure3PE.png');
axis equal