function Z = circle(r,c_re,c_img,n)
    theta = linspace(0,2*pi,n);
    X = r.*cos(theta)+c_re;
    Y = r.*sin(theta)+c_img;
    Z = complex(X,Y);
end