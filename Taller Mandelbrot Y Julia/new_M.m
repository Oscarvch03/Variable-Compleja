function O = new_M(W, r)
    [I, J] = size(W);
    O = zeros(I, J);
    for i = 1:I
        for j = 1:J
            cx = real(W(i, j));
            cy = imag(W(i, j));
            zx = real(W(i, j));
            zy = imag(W(i, j));
            iter = 0;
            iter_max = 1000;
            while(zx*zx+zy*zy <= r^2 && iter < iter_max)
                xtemp = zx * zx - zy * zy;
                zy = 2 * zx * zy + cy;
                zx = xtemp + cx;
                iter = iter + 1;
            end
            O(i, j) = iter;
        end
    end
end
    