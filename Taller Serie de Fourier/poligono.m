function h = poligono(n,r,cx,cy)
    theta = (0:((4*pi)/n):4*pi) + (pi/2);
    x = r.*sin(theta)+cx;
    y = r.*cos(theta)+cy;
    
    h = complex(x,y);
end