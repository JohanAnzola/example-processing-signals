%GENERACION DE UNA IMAGEN 2X2
%4 pixeles binaria
MA=[0,0,0,0,0,0,0,0,0,0,0,0;
    0,0,0,0,1,1,1,1,0,0,0,0;
    0,0,0,0,1,1,1,1,0,0,0,0;
    0,0,0,0,1,1,1,1,0,0,0,0;
    0,1,1,1,1,1,1,1,1,1,1,0;
    0,1,1,1,1,1,1,1,1,1,1,0;
    0,1,1,1,1,1,1,1,1,1,1,0;
    0,0,0,0,1,1,1,1,0,0,0,0;
    0,0,0,0,1,1,1,1,0,0,0,0;
    0,0,0,0,1,1,1,1,0,0,0,0;
    0,0,0,0,0,0,0,0,0,0,0,0];
%filas=alto columnas=ancho
%mostrar imagen
% % imshow(MA)
% % %1=blanco 0=negro
% % Dim=size(MA);
% % Columnas=Dim(1);
% % Filas=Dim(2);
% % %pixel por cada pixel
% % for i=1:Columnas
% %     for j=1:Filas
% %         Grises(i,j)=MA(i,j)*rand;
% %     end
% % end
% % figure 
% % imshow(Grises)

%genera matrices de color
Matriz_Rojo=0.5.*MA;
Matriz_Azul=1.*MA;
Matriz_Verde=0.2.*MA;
%componente rojo
Imagen_RGB(:,:,1)=Matriz_Rojo;
%componente Azul
Imagen_RGB(:,:,2)=Matriz_Azul;
%componente Verde
Imagen_RGB(:,:,3)=Matriz_Verde;
imshow(Imagen_RGB)
    