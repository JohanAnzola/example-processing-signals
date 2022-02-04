%pasabanda
clc, clear all
%caracteristicas de diseño
fsim=40000;
Rp=1;               %Rizado banda de paso
Rs=20;              %Risado banda atenuada
%
Wp=(2.*[4000 7000])/fsim;     %frecuencia inicial
Ws=(2.*[3000 8000])/fsim;     %Frecuencia de la banda atenuada

%tecnicas iguales
[N, Wn]=ellipord(Wp,Ws,Rp,Rs);
[b,a]=ellip(N,Rp, Rs,Wn);

%intervalo de prueba
f=0:1:10000;
H=freqz(b,a,f,fsim);

%Graficar
plot(f,abs(H),'linewidth',2);
title('Filtro pasabajos');
xlabel('frecuencia');
ylabel('Amplitud');