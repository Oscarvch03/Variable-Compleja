clc
a=2;
b=2;

x=-a:0.01:a;
y=-b:0.01:b;

time = 0:0.03:2*pi;
f = @(t) cos(t) + 1i*sin(t);
c = 0.7885 .* f(time)


v = VideoWriter('Julia.avi');
v.FrameRate = 20;

Z=matrix(a,b);

figure
colormap default;

open(v);

for i=1:length(c)
    W=new_J(Z,c(i),2,2);
    imagesc(x,y,W);
    F = getframe(gcf);
    writeVideo(v, F);
end

close(v);