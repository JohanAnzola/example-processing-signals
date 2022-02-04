Filtro=[1,1,1;
    0,0,0;
    -1,-1,-1];
%importar imagen
Ima=imread('Koopa.png')
figure(1)
imshow(Ima)
figure(2)
ImaR=Ima(:,:,1);
imshow(conv2(Filtro,ImaR))