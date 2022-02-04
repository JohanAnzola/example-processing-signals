clear, clc
ima1=imread('Hongo.jpg')
ima2=imread('Fondo.jpg')
%redimencionar tamaño
Escala=0.3;
ima3=imresize(ima1,Escala);
%guarde su tamaño en una variable
L=size(ima3)

%rutia de movimiento
Memoria=ima2;
for i=10:5:580
    %cree un arreglo que almacene las pociciones que bvaya a cambiar dejtro de
    %una imagen
    pos_ini_x=10+i;
    pos_ini_y=420;
    pos_y=pos_ini_y:pos_ini_y+L(1)-1;
    pos_x=pos_ini_x:pos_ini_x+L(2)-1;
    Memoria(pos_y,pos_x,:)=ima3;
    pixel=impixel(Memoria,pos_ini_x-1,pos_ini_y);
    %comparar arreglos
    if(isequal(pixel,[35,177,77]))
        break
    else
        imshow(Memoria)
        pause(0.1),
        Memoria=ima2;
    end
end