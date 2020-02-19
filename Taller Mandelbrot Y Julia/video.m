clc
a=2;
b=2;

x=-a:0.001:a;
y=-b:0.001:b;

time = 0:0.01:2*pi;
f = @(t) cos(t) + i*sin(t);
c = 0.7885 .* f(time)

out = zeros(length(time));

% for i=1:length(t)
%     
%     
% end
Z=matrix(a,b);
W=new_J(Z,c(100),2,2);



figure
imagesc(x, y, W)
colormap colorcube;