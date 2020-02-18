clc
a=2;
b=2;
x=-a:0.005:a;
y=-b:0.005:b;
Z=matrix(a,b);
lenZ = size(Z);

W=zeros(lenZ(1), lenZ(2));
exp=10;
for i=1:lenZ(1)
    for j=1:lenZ(2)
        w=Z(i,j);
        r=julia(w,1000,exp,w);
        W(i,j)= int8(r *127.5);
    end
end

% mesh(W)
imagesc(x, y, W)
colormap colorcube;