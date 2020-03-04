% Superficie Parametrica 2
clc
theta = linspace(-6.2,6.2, 1000);

X = [];
Y = [];

x = 10.*sin(2.78.*theta).*round(sqrt(cos(cos(8.2.*theta))));
y = 9.*(cos(2.78.*theta).^2).*sin(sin(8.2.*theta));

X = horzcat(X, x);
Y = horzcat(Y, y);

X(length(X)+1) = NaN;
Y(length(Y)+1) = NaN;

X = horzcat(X, x);
Y = horzcat(Y, y + 4);

X(length(X)+1) = NaN;
Y(length(Y)+1) = NaN;

X = horzcat(X, -1.*y+1.5);
Y = horzcat(Y, x+2);

X(length(X)+1) = NaN;
Y(length(Y)+1) = NaN;

X = horzcat(X, -1.*y-1.5);
Y = horzcat(Y, x+2);

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
plot3(a, b, c,'c')
hold on
plot3(X1, X2, X3, 'r')
axis equal
