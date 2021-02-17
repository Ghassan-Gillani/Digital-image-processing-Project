g=(Cam1b); 
g=fftshift(fft2(g));
g(170,170)=0;
g(88,88)=0;
g=ifft2(ifftshift(g));
colormap(gray);
imagesc(abs(g));

