clear, clc
%operaciones morfologicas
Ima=imread('circulos.jpg');
%cisculos rojos
Ima_R=Ima(:,:,1);
Ima_R=edge(Ima_R,'canny');
px=10;    %cantidad de pixeles
%erosion
SE = strel('disk',px)   %elemento extruturante
Im_E=imerode(Ima_R,SE);

%dilatacion
SE = strel('square',px)   %elemento extruturante
Im_D=imdilate(Ima_R,SE);

figure(1);
imshowpair(Ima_R,Im_E,'montage')

figure(2);
imshowpair(Ima_R,Im_D,'montage')