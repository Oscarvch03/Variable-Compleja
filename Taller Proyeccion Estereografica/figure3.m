% Superficie Parametrica 1
function figure3(handles)
    %%% Grafico y proyecto figure3PC.png

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

    axes(handles.axes1)
    
    plot(X, Y, 'r')
    xlabel('Eje Real')
    ylabel('Eje Imaginario')
    xlim([min(X), max(X)])
    ylim([min(Y), max(Y)])
    axes(handles.axes2)
    
    [a,b,c] = sphere(50);
    colormap winter
    plot3(a, b, c,'c')
    xlabel('Coordenada X1')
    ylabel('Coordenada X2')
    zlabel('Coordenada X3')
    hold on
    plot3(X1, X2, X3, 'r')
    xlim([-1 1])
    ylim([-1 1])
    zlim([-1 1])
    axis equal
end