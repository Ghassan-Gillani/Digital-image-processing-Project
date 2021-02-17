n=randn(256,256)*sqrt(0.2);
f=imread('cameraman.tif');
filt=[1,1,1;1,1,1;1,1,1]*(1/9);
fless=fft2(f); fless=fftshift(fless); imagesc(abs(fless));
fnoise=fft2(n);fnoise=fftshift(fnoise);imagesc(abs(fnoise));
ffilter=fft2(filt);ffilter=fftshift(ffilter);imagesc(abs(ffilter));
