%diseño de un filtro pasabajos
%Borrar el command window y variables de espacio de trabajo
clc, clear all
%caracteristicas de diseño
fsim=40000;
Rp=3;               %Rizado banda de paso
Rs=10;              %Risado banda atenuada
Wp=2*3000/fsim;     %frecuencia inicial
Ws=2*4000/fsim;     %Frecuencia de la banda atenuada
%Diseño por Butterwort filtro suabe y estable en banda de paso y eliminada
%calculo de los coeficientes de la funcion de transferencia
% %tecnica de diseño chevychev 1
% [N, Wn]=cheb1ord(Wp,Ws,Rp,Rs);
% [b,a]=cheby1(N,Rp,Wn);
%tecnica de diseñochevychev 2
% [N, Wn]=cheb2ord(Wp,Ws,Rp,Rs);
% [b,a]=cheby2(N,Rs,Wn);
%tecnica de diseño chevychev 3
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