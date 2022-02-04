clear, clc
%importar imagen
Ima=imread('Koopa.png')
%convierte en escala de gris
Ima_gray=rgb2gray(Ima);
%agrega ruido a la imagen
densidad=0.05;
Ima_con_ruido_1=imnoise(Ima_gray,'salt & pepper',densidad);
Ima_con_ruido_2=imnoise(Ima_gray,'gaussian');
%agrege un filtro
% Filtro=fspecial('average');

Filtro=fspecial('disk',10);


Ima_Filtrda_1=imfilter(Ima_con_ruido_1,Filtro);
Ima_Filtrda_2=imfilter(Ima_con_ruido_2,Filtro);
subplot(2,2,1)
imshow(Ima_con_ruido_1)
subplot(2,2,2)
imshow(Ima_Filtrda_1)
subplot(2,2,3)
imshow(Ima_con_ruido_2)
subplot(2,2,4)
imshow(Ima_Filtrda_2)