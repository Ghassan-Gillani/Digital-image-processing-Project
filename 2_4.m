 hist=(BadHist);
 pixels=size(hist,1)*size(hist,2);
 freq=zeros(256,1);
 pf=zeros(256,1);
 for i=1:size(hist,1)
 for j=1:size(hist,2)
 value=hist(i,j);
 freq(value+1)=freq(value+1)+1;
 pf(value+1)=freq(value+1)/pixels;
end
end
g1=gradient(pf);
t=transpose(g1);
p2=(pf*t);
plot(g1);
plot(pf);
plot(p2);
