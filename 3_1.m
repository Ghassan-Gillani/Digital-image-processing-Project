 f=imread('cameraman.tif');
 f=double(f)/256;
 n1=randn(256,256)*(sqrt(0.2));            
 n2=randn(256,256)*(sqrt(0.2));           
 f1=f+n1;
 f2=f+n2;
 avg=(f1+f2)/2;
 v1=var(f1(:));
 v2=var(f2(:));
 v3=var(avg(:));			     
 imagesc(avg); 
