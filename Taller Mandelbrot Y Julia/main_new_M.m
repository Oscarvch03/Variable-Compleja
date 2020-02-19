clc
a=2;
b=2;
x=-a:0.003:a;
y=-b:0.003:b;
Z=matrix(a,b);
W=new_M(Z, 2);
figure
mesh(x, y, W)
% imagesc(x, y, W)
colormap flag;