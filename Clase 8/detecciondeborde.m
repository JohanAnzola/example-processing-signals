clear, clc
%importar imagen
Ima=imread('Koopa.png')
%convierte en escala de gris
Ima_gray=rgb2gray(Ima);
%deteccion de bordes sobel
BW1 = edge(Ima_gray,'sobel');
%deteccion de bordes canny
BW2 = edge(Ima_gray,'canny');
figure;
imshowpair(BW1,BW2,'montage')
title('Filtro sobel y canny')