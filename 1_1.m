f=imread('cameraman.tif');
f=fftshift(fft2(f));
imagesc(abs(f));
title('2d transform');  colormap(gray);

