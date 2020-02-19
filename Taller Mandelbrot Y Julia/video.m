clc
a=2;
b=2;

x=-a:0.01:a;
y=-b:0.01:b;

time = 0:0.02:6*pi;
f = @(t) cos(t) + 1i*sin(t);
c = 0.7885 .* f(time);


v = VideoWriter('Julia2.avi');
v.FrameRate = 20;
v.Quality = 100;

Z=matrix(a,b);

figure
title('Set de Julia con n = 2 & c = 0.7885 * e**(i*t), con 0 <= t <= 6*pi')
xlabel('Eje Real');
ylabel('Eje Imaginario');
colormap hot;

open(v);

for i=1:length(c)
    W=new_J(Z,c(i),2,2);
    imagesc(x,y,W);
    title('Set de Julia con n = 2 & c = 0.7885 * e**(i*t), con 0 <= t <= 6*pi');
    xlabel('Eje Real');
    ylabel('Eje Imaginario');
    F = getframe(gcf);
    writeVideo(v, F);
end

close(v);