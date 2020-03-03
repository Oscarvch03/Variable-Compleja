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


ymax = max(y)

plot(X, Y)
axis equal