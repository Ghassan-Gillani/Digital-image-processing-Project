hist=(BadHist);
pixels=size(hist,1)*size(hist,2);
finalimg=uint8(zeros(size(hist,1),size(hist,2)));
freq=zeros(256,1);
pf=zeros(256,1);
for i=1:size(hist,1)
for j=1:size(hist,2)
value=hist(i,j);
freq(value+1)=freq(value+1)+1;
pf(value+1)=freq(value+1)/pixels;
end
end