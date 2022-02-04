clear, clc
%operaciones morfologicas
Ima=imread('circulos.jpg');
%cisculos rojos
Ima_R=Ima(:,:,1);
Ima_R=edge(Ima_R,'canny');
px=10;    %cantidad de pixeles

%dilatacion
SE = strel('disk',px)   %elemento extruturante
Ima_D=imdilate(Ima_R,SE);
%rellenar estructuras
Ima_D=imfill(Ima_D,'Holes');
figure;
imshow(Ima_D)
%optener el esqueleto
Ima_Esq = bwmorph(Ima_D,'skel',Inf);
figure;
imshow(Ima_Esq)
%skel,remove,circles, bridge