clear all
close all

n = 200;

%---------- Create the Paralelogram ----------
p1 = [-10,-1];
p2 = [1,-1];
p3 = [10,1];
p4 = [-1,1];
Z = paralelogram(p1,p2,p3,p4,n);
%---------------------------------------

%---------- Create the noise ----------
N1 = randn(1,n); % real noise 
N2 = randn(1,n); % imagine noise
%---------------------------------------

max_N1 = get_max(N1);
max_N2 = get_max(N2);

N1 = N1./max_N1;
N2 = N2./max_N2;

N1 = N1./2;
N2 = N2./2;

Re = real(Z);
Img = imag(Z);
Re_N = Re+N1;
Img_N = Img+N2;


figure
grid on
plot(Re,'b');
hold on 
plot(Re_N,'-.r');
legend('Número Complejo sin Ruido','Número Complejo afectado por Ruido')
xlabel('Muestras[n]')
ylabel('Amplitud[u.a]')
title('Parte real')
saveas(gcf,'P2_4_parte_real.png')


figure
grid on
plot(Img,'b');
hold on 
plot(Img_N,'-.r');
legend('Número Complejo sin Ruido','Número Complejo afectado por Ruido')
xlabel('Muestras[n]')
ylabel('Amplitud[u.a]')
title('Parte Imaginaria')
saveas(gcf,'P2_4_parte_imaginaria.png')


figure
grid on
plot(Re,Img,'b');
hold on 
plot(Re_N,Img_N,'-.r');
legend('Número Complejo sin Ruido','Número Complejo afectado por Ruido')
xlabel('Real[u.a]')
ylabel('Imaginario[u.a]')
title('Gráfica del Paralelogramo')
saveas(gcf,'P2_4_paralelogramo.png')


Z_N = complex(Re_N,Img_N);

y = fft(Z);

y_N = fft(Z_N);


figure
grid on
plot(abs(y),'b');
hold on 
plot(abs(y_N),'-.r');
legend('Número Complejo sin Ruido','Número Complejo afectado por Ruido')
xlabel('Muestras[n]')
ylabel('Amplitud[u.a]')
title('Amplitud de los Coeficientes de Fourier')
saveas(gcf,'P2_4_amplitudF.png')


figure
plot(angle(y),'b');
hold on
plot(angle(y_N),'-.r');
legend('Número Complejo sin Ruido','Número Complejo afectado por Ruido')
xlabel('Muestras[n]')
ylabel('Amplitud[u.a]')
title('Angulo de los Coeficientes de Fourier')
saveas(gcf,'P2_4_anguloF.png')


colors = ["r","g","c"];
figure
grid on
plot(Re,Img,'b');
title('Gráfica del Paralelogramo F')

m = 15; %cuantos elementos tengo diferente de 0 a la izquierda

for i=1:3
    min = m+1;
    max = n-m;
    y_N(min:max) = 0;
    W = ifft(y_N);
    str = "-."+colors(i);
    hold on 
    plot(real(W),imag(W),str);
    m = m-6; 
end 
    
legend('Número Complejo sin Ruido','Número Complejo Filtrado','Número Complejo Filtrado +','Número Complejo Filtrado ++')
xlabel('Real[u.a]')
ylabel('Imaginario[u.a]')
xlim([-15, 15])
ylim([-2,2])
saveas(gcf,'P2_4_paralelogramoF.png')


figure
grid on
plot(Re,'b');
hold on 
plot(real(W),'-.r');
legend('Número Complejo sin Ruido','Número Complejo afectado por Ruido')
xlabel('Muestras[n]')
ylabel('Amplitud[u.a]')
title('Parte real F')
saveas(gcf,'P2_4_parte_real_F.png')


figure
grid on
plot(Img,'b');
hold on 
plot(imag(W),'-.r');
legend('Número Complejo sin Ruido','Número Complejo afectado por Ruido')
xlabel('Muestras[n]')
ylabel('Amplitud[u.a]')
title('Parte Imaginaria F')
saveas(gcf,'P2_4_parte_imaginaria_F.png')
