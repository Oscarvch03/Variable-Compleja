function O = new_J(W, c, r, n)
    [I, J] = size(W);
    O = zeros(I, J);
    for i = 1:I
        for j = 1:J
            cx = real(c);
            cy = imag(c);
            zx = real(W(i, j));
            zy = imag(W(i, j));
            iter = 0;
            iter_max = 1000;
            while(zx*zx+zy*zy <= r^2 && iter < iter_max)
                xtemp = (zx*zx+zy*zy)^(n/2)*cos(n*atan2(zy,zx))+cx;
                zy =(zx*zx+zy*zy)^(n/2)*sin(n*atan2(zy,zx)) + cy;
                zx = xtemp;
                iter = iter+1;
            end
            O(i, j) = iter;
        end
    end
end