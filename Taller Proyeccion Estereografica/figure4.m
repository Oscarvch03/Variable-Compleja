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

plot(X, Y)
axis equal