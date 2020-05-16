clear all
close all

n = 100;

%---------- Create the circle ----------
c_re = 0;
c_img = 0;
r = 1;
Z = circle(r,c_re,c_img,n);
%---------------------------------------

%---------- Create the noise ----------
N1 = randn(1,n); % real noise 
N2 = randn(1,n); % imagine noise
%---------------------------------------

max_N1 = get_max(N1);
max_N2 = get_max(N2);


colors = ["r","g","c","k",];
k = [1,2.5,4.5,5.5];

Re = real(Z);
Img = imag(Z);

y = fft(Z-mean(Z));

figure
title('Amplitud de los Coeficientes de Fourier')
grid on
plot(abs(y),'b');
hold on 

for i=1:4
    N1 = (N1./(max_N1))*(k(i));
    N2 = (N2./(max_N2))*(k(i));

    Re_N = Re+N1;
    Img_N = Img+N2;
    
    str = "-."+colors(i);
    
    Z_N = complex(Re_N,Img_N);
    y_N = fft(Z_N-mean(Z_N));
    plot(abs(y_N),str);
    hold on
end

legend('Número Complejo sin Ruido','Número Complejo afectado por Ruido','Número Complejo afectado por Ruido +','Número Complejo afectado por Ruido ++','Número Complejo afectado por Ruido +++')
xlabel('Muestras[n]')
ylabel('Amplitud[u.a]')
saveas(gcf, 'P3_amplitud1.png')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
title('Amplitud de los Coeficientes de Fourier')
grid on
plot(abs(y),'b');
hold on 

for i=1:4
    N1 = (N1./(max_N1))*(1/k(i));
    N2 = (N2./(max_N2))*(1/k(i));

    Re_N = Re+N1;
    Img_N = Img+N2;
    
    str = "-."+colors(i);
    
    Z_N = complex(Re_N,Img_N);
    y_N = fft(Z_N-mean(Z_N));
    plot(abs(y_N),str);
    hold on
end

legend('Número Complejo sin Ruido','Número Complejo afectado por Ruido','Número Complejo afectado por Ruido -','Número Complejo afectado por Ruido --','Número Complejo afectado por Ruido ---')
xlabel('Muestras[n]')
ylabel('Amplitud[u.a]')
saveas(gcf, 'P3_amplitud2.png')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
title('Angulo de los Coeficientes de Fourier')
grid on
plot(angle(y),'b');
hold on 

for i=1:4
    N1 = (N1./(max_N1))*(k(i));
    N2 = (N2./(max_N2))*(k(i));

    Re_N = Re+N1;
    Img_N = Img+N2;
    
    str = "-."+colors(i);
    
    Z_N = complex(Re_N,Img_N);
    y_N = fft(Z_N-mean(Z_N));
    plot(angle(y_N),str);
    hold on
end

legend('Número Complejo sin Ruido','Número Complejo afectado por Ruido','Número Complejo afectado por Ruido +','Número Complejo afectado por Ruido ++','Número Complejo afectado por Ruido +++')
xlabel('Muestras[n]')
ylabel('Amplitud[u.a]')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
title('Angulo de los Coeficientes de Fourier')
grid on
plot(angle(y),'b');
hold on 

for i=1:4
    N1 = (N1./(max_N1))*(1/k(i));
    N2 = (N2./(max_N2))*(1/k(i));

    Re_N = Re+N1;
    Img_N = Img+N2;
    
    str = "-."+colors(i);
    
    Z_N = complex(Re_N,Img_N);
    y_N = fft(Z_N-mean(Z_N));
    plot(angle(y_N),str);
    hold on
end

legend('Número Complejo sin Ruido','Número Complejo afectado por Ruido','Número Complejo afectado por Ruido -','Número Complejo afectado por Ruido --','Número Complejo afectado por Ruido ---')
xlabel('Muestras[n]')
ylabel('Amplitud[u.a]')