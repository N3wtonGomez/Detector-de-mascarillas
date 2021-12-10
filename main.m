pkg load image;
clc; clear all variables;

# primero leemos la imagen
imagen = imread("nocubre.jpeg");
figure(1); imshow(imagen);

Imagen = double (imagen);
[x,y,z] = size (Imagen);

for i = 1:x
    for j = 1:y
        
        d(1) = sqrt( ((255-Imagen(i,j,1))^2) + ((0-Imagen(i,j,2))^2) + ((0-Imagen(i,j,3))^2) );
        d(2) = sqrt( ((0-Imagen(i,j,1))^2) + ((255-Imagen(i,j,2))^2) + ((0-Imagen(i,j,3))^2) );
        d(3) = sqrt( ((0-Imagen(i,j,1))^2) + ((0-Imagen(i,j,2))^2) + ((255-Imagen(i,j,3))^2) );
        d(4) = sqrt( ((0-Imagen(i,j,1))^2) + ((0-Imagen(i,j,2))^2) + ((0-Imagen(i,j,3))^2) );
        d(5) = sqrt( ((255-Imagen(i,j,1))^2) + ((255-Imagen(i,j,2))^2) + ((255-Imagen(i,j,3))^2) );
        
        minimo = min (d);
        
        if minimo == d(1);
            imagen(i,j,1) = 255;
            imagen(i,j,2) = 0;
            imagen(i,j,3) = 0;
            
        elseif minimo == d(2);
            
            imagen(i,j,1) = 0;
            imagen(i,j,2) = 255;
            imagen(i,j,3) = 0;
            
        elseif minimo == d(3);
            
            imagen(i,j,1) = 0;
            imagen(i,j,2) = 0;
            imagen(i,j,3) = 255;
            
        elseif minimo == d(4);
            
            imagen(i,j,1) = 0;
            imagen(i,j,2) = 0;
            imagen(i,j,3) = 0;
            
        elseif minimo == d(5);
            
            imagen(i,j,1) = 255;
            imagen(i,j,2) = 255;
            imagen(i,j,3) = 255;
        endif
    endfor
endfor
figure(2); imshow(imagen);

imgR = double( imagen(:,:,1) );
imgG = double( imagen(:,:,2) );
imgB = double( imagen(:,:,3) );

imagenA = (imgB - imgR - imgG);
imagenA = imagenA < 5;
figure(3); imshow(imagenA);

imagenA = not(imagenA);

SE = strel('diamond', 5);
filtrada = imdilate(imagenA, SE);
figure(4); imshow(filtrada);

anser = max(max(filtrada))
if max(max(filtrada)) > 0
    fprintf("La persona si usa cubrebocas AZUL");
else
    disp("la persona no usa cubrebocas AZUL");
endif

pause();