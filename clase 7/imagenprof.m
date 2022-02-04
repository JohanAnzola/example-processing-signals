ima=imread('hongoj.jpg');
imshow(ima);
Comp_R=ima(:,:,1);
Comp_G=ima(:,:,2);
Comp_B=ima(:,:,3);
%presentar
subplot(3,1,1);
imshow(Comp_R);
subplot(3,1,2);
imshow(Comp_G);
subplot(3,1,3);
imshow(Comp_B);

%imbinarize pone en escala de negros (compo,(valor de umbral por defecto 0.5))
ima_bina_1=imbinarize(Comp_R)
%binarizar Rgb a escala de grises
ima_gris=rgb2gray(ima)
%presentar

%asi se muestra en parea dos imagenes y monatge las pone una al lado de la
%otra
imshowpair(ima,ima_gris,'montage')

%se puede combinar rgb3gray y luego imbinarize para eliminar partes de la
%imagen por debajo del umbral

%determianr el color de un pixel
fila=12
columna=10;
%indicacion del color
impixel(ima,columna,fila)
%visor de imagenes
imtool(ima)