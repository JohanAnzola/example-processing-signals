clear, clc
%operaciones morfologicas
Ima=imread('circulos.jpg');
%cisculos rojos
Ima_R=Ima(:,:,1);
Ima_R=imbinarize(Ima_R,0.5);
px=10;    %cantidad de pixeles
%erosion
SE = strel('disk',px)   %elemento extruturante
Im_E=imerode(Ima_R,SE);

%dilatacion
SE = strel('disk',px)   %elemento extruturante
Im_D=imdilate(Ima_R,SE);

figure(1);
imshowpair(Ima,Im_E,'montage')

figure(2);
imshowpair(Ima_R,Im_D,'montage')