% a=gaussmf(1:10,[1,5]);
% plot(a)
% 
clc, clear
%%variable 1
%defina intervalo de temperatura
x1=0:0.1:50;
%definaa la salida
corte_inf=10;
corte_sup=40;
y1=smf(x1,[corte_inf, corte_sup]);
figure
plot(x1,y1,'linewidth',3); grid on;

%%variable 2
%defina intervalo de temperatura
x2=0:0.1:4;
%definaa la salida 2
corte_inf=2;
corte_sup=3;
y2=smf(x2,[corte_inf, corte_sup]);
figure
plot(x2,y2,'linewidth',3); grid on;

%producto cartesiao
for i=1:length(y1)
    for j=1:length(y2)
        MA(i,j)=min(y1(i),y2(j));
    end
end
%intervalos de la malla
[x,y]=meshgrid(x2,x1);
%imprimir malla
mesh(x,y,MA)