

%Inicio :)
clear all

[do,Fs]=audioread('sonidodo.wav');
[re,Fs]=audioread('sonidore.wav');
[mi,Fs]=audioread('sonidomi.wav');
[fa,Fs]=audioread('sonidofa.wav');
[sol,Fs]=audioread('sonidosol.wav');
[la,Fs]=audioread('sonidola.wav');
[si,Fs]=audioread('sonidosi.wav');

aleator=randi([1 7],1,2)

for k=1:length(aleator)
    if aleator(k)== 1
        
        sound(do,Fs)
        pause(2)
    elseif aleator(k)== 2
        sound(re,Fs)
        pause(2)
    elseif aleator(k)== 3
        sound(mi,Fs)
        pause(2)
    elseif aleator(k)== 4
        sound(fa,Fs)
        pause(2)
    elseif aleator(k)== 6
        sound(la,Fs)
        pause(2)
    elseif aleator(k)== 5
        sound(sol,Fs)
        pause(2)
    elseif aleator(k)== 7
        sound(si,Fs)
        pause(2)
    end  
end
tam=8192 %tamapño muestras
L=length(1:tam);
NFFT=2^nextpow2(L);
f=(Fs/2)*linspace(0,1,NFFT/2+1);


Ydo=fft(do(26140:26140+tam),NFFT)/L;
fdo=2*abs(Ydo(1:NFFT/2+1));

Yre=fft(re(28250:28250+tam),NFFT)/L;
fre=2*abs(Yre(1:NFFT/2+1));

Ymi=fft(mi(14470:14470+tam),NFFT)/L;
fmi=2*abs(Ymi(1:NFFT/2+1));

Yfa=fft(fa(28200:28200+tam),NFFT)/L;
ffa=2*abs(Yfa(1:NFFT/2+1));

Ysol=fft(sol(20950:20950+tam),NFFT)/L;
fsol=2*abs(Ysol(1:NFFT/2+1));

Yla=fft(la(24930:24930+tam),NFFT)/L;
fla=2*abs(Yla(1:NFFT/2+1));

Ysi=fft(si(33000:33000+tam),NFFT)/L;
fsi=2*abs(Ysi(1:NFFT/2+1));

audio=audiorecorder(44100,16,1); %Configuración de toma de muestras de audio

nota=''
compara=[]
i=0
maximoo=[]
silencio=1
maximoantiguo=0
k=1
while k<=100  %Durará unos pocos segundos, procurá tener el micrófono activado en tu PC
   figure(2) %Crea figura vacía
    record(audio); %Empieza a tomar audio
    pause(.12); %Pausa de .01 segundos
    stop(audio); %Detiene la toma de muestras de audio
    au=getaudiodata(audio); %En au se guarda el vector de datos de audio
    auf=abs(fft(au)); %Módulo de la fft de los datos
    clf %Limpia figura
    L=length(au);
    NFFT=2^nextpow2(L);
    Y=fft(au,NFFT)/L;
    f=(Fs/2)*linspace(0,1,NFFT/2+1);
    %espectro de frecuencia
    ftreal=2*abs(Y(1:NFFT/2+1));
    plot(f,ftreal,'LineWidth',2);
    grid on;
    title('Espectro de frecuencia');
    xlabel('freciuencia');
    ylabel('magnitud');
    maximoo(k)=max(au)
    maximoof(k)=max(ftreal)
    if max(au) > 0.09 && max(au)>maximoantiguo
        rndo=xcorr(fdo,ftreal,'normalized');
        rnre=xcorr(fre,ftreal,'normalized');
        rnmi=xcorr(fmi,ftreal,'normalized');
        rnfa=xcorr(ffa,ftreal,'normalized');
        rnsol=xcorr(fsol,ftreal,'normalized');
        rnla=xcorr(fla,ftreal,'normalized');
        rnsi=xcorr(fsi,ftreal,'normalized');
        m=ceil(length(rndo)/2)
        if rndo(m) > 0.7 && silencio == 1
            nota='do'
            i=i+1
            compara(i)=1
%             if aleator(i)==1
%                nota2=nota 
%             end
        elseif rnre(m) > 0.6 && silencio == 1
            nota='re'
            i=i+1
            compara(i)=2
        elseif rnmi(m) > 0.7 && silencio == 1
            nota='mi'
            i=i+1
            compara(i)=3
        elseif rnfa(m) > 0.6 && silencio == 1
            nota='fa'
            i=i+1
            compara(i)=4
        elseif rnsol(m) > 0.7 && silencio == 1
            nota='sol'
            i=i+1
            compara(i)=5
        elseif rnla(m) > 0.7 && silencio == 1
            nota='la'
            i=i+1
            compara(i)=6
        elseif rnsi(m) > 0.7 && silencio == 1
            nota='si'
            i=i+1
            compara(i)=7
        end
        silencio=0;
    else
        nota='Siguiente'
        silencio=1;
    end
    if length(compara)==length(aleator)
        k=100
    end
    k=k+1
    maximoantiguo=max(au)
end

%Fin :)