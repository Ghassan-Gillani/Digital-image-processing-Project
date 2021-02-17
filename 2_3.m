hist=(BadHist);
pixels=size(hist,1)*size(hist,2);
finalimg=uint8(zeros(size(hist,1),size(hist,2)));
freq=zeros(256,1);
pf=zeros(256,1);
pc=zeros(256,1);
c=zeros(256,1);
output=zeros(256,1);
for i=1:size(hist,1)
for j=1:size(hist,2)
value=hist(i,j);
freq(value+1)=freq(value+1)+1;
pf(value+1)=freq(value+1)/pixels;
end
end
sum=0;
for i=1:size(freq)
sum=sum+freq(i);
c(i)=sum;
pc(i)=c(i)/pixels;
output(i)=round(pc(i)*255);
end
for i=1:size(hist,1)
for j=1:size(hist,2)
finalimg(i,j)=output(hist(i,j)+1);
end
end
imhist(finalimg);