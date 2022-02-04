clc, clear all
Fs=41800;
figure(1)
t=0:1/Fs:4;
y=[sin(200*pi*t(1:end/2)),sin(800*pi*t(end/2:end))];

%grtafico
plot(t,y,'linewidt',2);
grid on;
title('señal original');
xlabel('tiempo s');
ylabel('Amplitud');

L=length(y);
NFFT=2^nextpow2(L);
Y=fft(y,NFFT)/L;
f=(Fs/2)*linspace(0,1,NFFT/2+1);
%espectro de frecuencia
figure(2)
plot(f,2*abs(Y(1:NFFT/2+1)),'LineWidth',2);
grid on;
title('Espectro de frecuencia');
xlabel('freciuencia');
ylabel('magnitud')

Rp=5;               %Rizado banda de paso
Rs=20;              %Risado banda atenuada
%
Wp=(2.*[300 500])/Fs;     %frecuencia inicial
Ws=(2.*[200 600])/Fs;     %Frecuencia de la banda atenuada

%tecnicas iguales
[N, Wn]=buttord(Wp,Ws,Rp,Rs);
[b,a]=butter(N,Wn);

f0=0
f_paso=1
ff=1000
%intervalo de prueba
f=f0:f_paso:ff;
H=freqz(b,a,f,Fs);
figure(3)
%Graficar
plot(f,abs(H),'linewidth',2);
title('Filtro pasabanda');
xlabel('frecuencia');
ylabel('Amplitud');

%%filtrado de la señal
Filtrada=filter(b,a,y);
%trasformada de señal filtrada
L=length(Filtrada);
NFFT=2^nextpow2(L);
Y=fft(Filtrada,NFFT)/L;
f=(Fs/2)*linspace(0,1,NFFT/2+1);
%espectro en gfrecuencia
figure(4)
plot(f,2*abs(Y(1:NFFT/2+1)),'LineWidth',2);
grid on;
title('Señal filtrada Espectro de frecuencia');
xlabel('freciuencia');
ylabel('magnitud')
%señal filtrada domiio del tiempo
figure (5)
plot(t,Filtrada,'LineWidth',2);
grid on;
title('Señal filtrada Dom t');
xlabel('tiempo');
ylabel('amplitud')



