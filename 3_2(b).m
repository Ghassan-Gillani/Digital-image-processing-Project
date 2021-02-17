  N=randn(256,256)*sqrt(0.2);
  f=imread('cameraman.tif');
  f=double(f)./256.0;
  fn1=f+N;
  filt=[1,1,1;1,1,1;1,1,1]*(1/9);
  g=imfilter(f,filt);
  imagesc(g);
