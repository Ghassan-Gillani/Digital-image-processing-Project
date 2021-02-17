f=imread('cameraman.tif');
f=double(f)./256.0;
n=randn(256,256)*(sqrt(0.2));
 f1=f+n;
 [x,y]=size(f1);
sum=0;
for i=1:x
for j=1:y
sum=sum+f1(i,j);
end
end
mean=0;
mean=sum/(x*y);	 
ans=0;
ans1=0;
for i=1:x
for j=1:y
ans=f1(i,j)-mean;
ans=ans*ans;
ans1=ans1+ans;
end
end
sum1=0;
sum1=ans1/(x*y);
result=sqrt(sum1);