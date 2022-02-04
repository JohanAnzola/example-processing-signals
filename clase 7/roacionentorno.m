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
for i=10:4:1000
    %cree un arreglo que almacene las pociciones que bvaya a cambiar dejtro de
    %una imagen
    Memoria1=Memoria(1:end,1:4,:);
    Memoria2=Memoria(1:end,5:end,:);
    Memoria(1:end,end-3:end,:)=Memoria1;
    Memoria(1:end,1:end-4,:)=Memoria2;
    %almacena oara poner el hongo
    Temp=Memoria(1:end,1:end,:);
    
    
%     imshow(Memoria)
%     pause(0.00001)
    
    pixel=impixel(Temp,274,444);
    if(isequal(pixel,[35,177,77]))
        Memoria(400:399+L(1),200-i:199+L(2)-i,:)=ima3;
        gra=Memoria;
        a=1
    else
        %         imshow(Memoria)
        %         pause(0.1),
        %         Memoria=ima2;
        Temp(400:399+L(1),200:199+L(2),:)=ima3;
        gra=Temp;
        a=2
    end
    imshow(gra)
    pause(0.00001)
    
end