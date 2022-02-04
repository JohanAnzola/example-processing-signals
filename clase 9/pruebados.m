clc, clear
%%variable 1
%defina el conjunto unierso
x=0:0.01:1;
y=0:0.01:5;
%definaa el conjunto 1
corte_inf=15;
corte_sup=0.5;
A=sigmf(x,[corte_inf, corte_sup]);
figure
plot(x,A,'linewidth',3); legend('Conjunto A'); grid on;


%defina conjunto 2
corte_inf=-3;
corte_sup=2.5;
B=sigmf(y,[corte_inf, corte_sup]);
figure
plot(y,B,'linewidth',3); legend('Conjunto B'); grid on;

%producto cartesiao
for i=1:length(A)
    for j=1:length(B)
        R(i,j)=min(A(i),B(j));
    end
end
%intervalos de la malla
[X,Y]=meshgrid(x,y);
%imprimir malla
mesh(X,Y,R')

%finalmente la composiscion seria
Ap=gaussmf(x,[0.04,0.3]);
for j=1:length(B)
    for i=1:length(A)
        Salida(i)=min(Ap(i),R(i,j));
    end
    Bp(j)=max(Salida)
end
figure,plot(x,Ap,'linewidth',3); legend('Conjunto B'); grid on;
figure,plot(y,Bp,'linewidth',3); legend('Conjunto B'); grid on;