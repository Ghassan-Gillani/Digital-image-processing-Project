f=imread('trees.tif');
pixels=size(f,1)*size(f,2);
imshow(f);
imhist(f);
>> finalimg=uint8(zeros(size(f,1),size(f,2)));
>> freq=zeros(256,1);
>> pf=zeros(256,1);
>> pc=zeros(256,1);
>> c=zeros(256,1);
>> output=zeros(256,1);
>> for i=1:size(f,1)
for j=1:size(f,2)
value=f(i,j);
freq(value+1)=freq(value+1)+1;
pf(value+1)=freq(value+1)/pixels;
end
end
>> sum=0;
>> for i=1:size(freq)
sum=sum+freq(i);
c(i)=sum;
pc(i)=c(i)/pixels;
output(i)=round(pc(i)*255);
end
>> for i=1:size(f,1)
for j=1:size(f,2)
finalimg(i,j)=output(f(i,j)+1);
end
end
imhist(finalimg);
