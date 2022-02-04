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
imshow(MA)
%1=blanco 0=negro
Dim=size(MA);
Columnas=Dim(1);
Filas=Dim(2);
%pixel por cada pixel
for i=1:Columnas
    for j=1:Filas
        Grises(i,j)=MA(i,j)*rand;
    end
end
figure 
imshow(Grises)
    