clear, clc
%operaciones morfologicas
Ima=imread('circulos.jpg');
%cisculos rojos
Ima_R=Ima(:,:,1);
Ima_R=edge(Ima_R,'canny');
[L, Ne]=bwlabel(Ima_R);
%L es la imgen
%Ne es el nú,ero de elementos de laimgen

%estimar propiedades
propiedad=regionprops(L,'BoundingBox');%ubicacion
%Area, Centroid, BoundingBox, SubarrayIdx, MajorAxisLength,
%MinorAxisLength, Eccentricity, Orientation, Convexhull,
%ConvexImage, ConvexArea, Image, FilledImage, FilledArea,
%EulerNumber,  Extrema, EquivDiameter, Solidity, Extent,
%PixelIdxList, PixelList, Perimeter.
Area=regionprops(L,'Area');%Area de cada circulo en poixeles
Perimetro=regionprops(L,'Perimeter')%Perimetro de cada circulo


figure;
imshow(L)
disp(Ne)