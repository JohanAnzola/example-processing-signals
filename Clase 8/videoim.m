clc, clear all
% %matlab de web
% %webcamlist: obtiene informacion de l adaptador de video disponible
% Adaptador=webcamlist
% %matlab retorna ña cantidad de dispositivos disponibles
% Camara=Webcam('USB2.0 Camera');
% %Establezxa el formato 
% %presente en una ventana
clc; clear;
close all; objects = imaqfind %find video input objects in memory
delete(objects) %delete a video input object from memory

%%matlab escritorio
Adaptador=imaqhwinfo('winvideo') %retorna la cantirdad de dispositivos
%DeviceIDs indica cuantos dispositicos de video estan disponibles
%cree un objeto de donde quira tomar la imagen
Camara=imaqhwinfo('winvideo',1)
%Establesca el formato
Video=videoinput('winvideo',1,'RGB24_640x360')
%presente en una ventana
preview(Video);
%con get obtiene una imagen
 imagen=getsnapshot(Video);
