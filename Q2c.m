I = imread('linear.tif');
x = double(I);
%method of correction
Correction = 255 * (x/255).^ 0.5;
imshow(Correction)

imshowpair(I,Correction,'montage')