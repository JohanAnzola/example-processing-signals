clear, clc
ima1=imread('Hongo.jpg')
ima2=imread('Fondo.jpg')
%redimencionar tamaño
Escala=0.1;
ima3=imresize(ima1,Escala);
%guarde su tamaño en una variable
L=size(ima3)
%cree un arreglo que almacene las pociciones que bvaya a cambiar dejtro de
%una imagen
imshow(ima2)
[x,y] = getpts
if length(x)==1 && length(y)==1
pos_ini_x=round(x);
pos_ini_y=round(y);
pos_y=pos_ini_y:pos_ini_y+L(1)-1;
pos_x=pos_ini_x:pos_ini_x+L(2)-1;
%remplace los valores de al imagen  peuqña en la grand
ima2(pos_y,pos_x,:)=ima3;
%presente la imagen
imshow(ima2)
else
    [x,y] = getpts
end
