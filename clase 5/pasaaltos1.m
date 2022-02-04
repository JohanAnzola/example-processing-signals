%diseño de un filtro pasa alto solo se agreg high
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
[N, Wn]=buttord(Wp,Ws,Rp,Rs);
[b,a]=butter(N,Wn,'High');
%El comano tf presenta la funcion de transferencia
% Tiempo_muestreo_ejemplo=0.1;
% tf(b,a,Tiempo_muestreo_ejemplo,'variable','Z^-1')

%Establesca un rango de simulacion para conocer el
%comportamiento del filtro
%frecuencia en herz
f0=0;
paso=1;
ff=10000;
f=f0:paso:ff;
%estimar la respuesta del filtro
H=freqz(b,a,f,fsim);
%Graficar
plot(f,abs(H),'linewidth',2);
title('Filtro pasabajos');
xlabel('frecuencia');
ylabel('Amplitud');