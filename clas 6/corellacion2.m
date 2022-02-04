clc, clear
%Defina los arreglos de prueba
Nombre_archivo='sonidofa.wav'
[ys,Fs]=audioread(Nombre_archivo)
Nombre_archivo2='sonidomi.wav'
[ys2,Fs2]=audioread(Nombre_archivo2)
%soud se usa para reproducir el sonido
sound(ys2,Fs)

L=length(ys);
NFFT=2^nextpow2(L);
Y=fft(ys,NFFT)/L;
f=(Fs/2)*linspace(0,1,NFFT/2+1);
%espectro de frecuencia
figure(4)
Yp=2*abs(Y(1:NFFT/2+1))
plot(f,Yp,'LineWidth',2);
grid on;
title('Espectro de frecuencia');
xlabel('freciuencia');
ylabel('magnitud')

L2=length(ys2);
NFFT2=2^nextpow2(L2);
Y2=fft(ys2,NFFT2)/L2;
f2=(Fs/2)*linspace(0,1,NFFT2/2+1);
%espectro de frecuencia
figure(3)
Yp2=2*abs(Y2(1:NFFT2/2+1))
plot(f2,Yp2,'LineWidth',2);
grid on;
title('Espectro de frecuencia');
xlabel('freciuencia');
ylabel('magnitud')

x=Yp;
y=Yp2;
%grafique los resultados
figure (1)
%haga una auto correlacion normalizada
subplot(2,2,1)
x1=x;
y1=x;
[rnxy,m]=xcorr(x1,y1,'normalized');
stem(m,rnxy,'linewidth',2);
grid on;

%haga una correlacion cruzada entre los vectores
subplot(2,2,2)
x2=x;
y2=y;
[rnxy,m]=xcorr(x2,y2,'normalized');
stem(m,rnxy,'linewidth',2); grid on;
xlabel('m'); ylabel('Amplitud'); title('diferente 1')

%correlacion crusada frentet a u factos
% subplot(2,2,3)
% x3=x;
% y3=x.*rand(1,length(x));
% [rnxy,m]=xcorr(x3,y3,'normalized');
% stem(m,rnxy,'linewidth',2); grid on;
% xlabel('m'); ylabel('Amplitud'); title('deferente 2')
% axis([-5 5 0 1]);
%correlacion cruzada frente a unn sumando
% subplot(2,2,4)
% x4=x;
% y4=x+random('Normal',0,1,1,length(x));
% [rnxy,m]=xcorr(x4,y4,'normalized');
% stem(m,rnxy,'linewidth',2); grid on;
% xlabel('m'); ylabel('Amplitud'); title('diferentes 3')
% axis([-5 5 0 1]);