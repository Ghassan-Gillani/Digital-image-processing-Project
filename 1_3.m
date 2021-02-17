 f=imread('coins.png');
 filter=[1,1,1;1,1,1;1,1,1]*(1/9);
 f=imfilter(f,filter);
 colormap(gray);
 imagesc(abs(f));

