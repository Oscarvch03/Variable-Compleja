clc
a=2;
b=2;
x=-a:0.003:a;
y=-b:0.003:b;
Z=matrix(a,b);
W=new_J(Z,0.279,2,2);
figure
imagesc(x, y, W)
colormap colorcube;