clc
a=2;
b=2;
x=-a:0.005:a;
y=-b:0.005:b;
Z=matrix(a,b);
lenZ = size(Z);

W=zeros(lenZ(1), lenZ(2));

for i=1:lenZ(1)
    for j=1:lenZ(2)
        w=Z(i,j);
        r=mandelbrot(w,1000);
        W(i,j)=int8(r*127.5);
    end
end

mesh(x, y, W)
% imagesc(x, y, W)
colormap colorcube;


% Revisar inwrite(matriz, nombre.png) para la animacion

