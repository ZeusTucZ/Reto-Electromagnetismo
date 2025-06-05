function animacion(zm, imagen, nombre)
%zm vector con puntos del objeto
%imagen Archivo de imagen de fondo
%Nombre del video de salida

%Rango de imagen
x_range = [-6, 6];
z_range = [-6, 6];

%Crear el video
writerObj = VideoWriter(nombre, 'MPEG-4');
writerObj.FrameRate = 24;
open(writerObj)

img = imread(imagen);
figure(100); clf
imagesc(x_range, z_range, flipud(img));  % Imagen de fondo
axis xy
hold on
xlabel('x (m)')
ylabel('z (m)')
title('Trayectoria sobre campo magnético')

% Simular trayectoria punto a punto
for i = 1:length(zm)
    cla
    imagesc(x_range, z_range, flipud(img));  % Redibujar fondo
    axis xy
    hold on
    scatter(0, zm(i), 100, 'r', 'filled')
    xlim(x_range)
    ylim(z_range)
    frame = getframe(gcf);
    writeVideo(writerObj, frame);
end

close(writerObj);
disp(['Video guardado como ', nombre])
end