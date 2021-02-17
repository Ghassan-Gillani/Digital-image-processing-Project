
%matrix of 256*256 

I = zeros(256,256);

for j= 1:32:255
    k=j; 
    
for r = k:4:k+15
    
  for c = 1:4:255 
      
   I(r,c)= 255; %placing 1
   I(r,c+1)= 255; %placing 1
   I(r,c+2)=0;     %placing 0
   I(r,c+3)= 0;     %placing 0
   
   I(r+1,c)= 255;   %placing 1
   I(r+1,c+1)= 255;  %placing 1
   I(r+1,c+2)=0;     %placing 0
   I(r+1,c+3)= 0;    %placing 0
   
   I(r+2,c)= 0;      %placing 0
   I(r+2,c+1)= 0;    %placing 0
   I(r+2,c+2)=255;    %placing 1
   I(r+2,c+3)= 255;    %placing 1
   
   I(r+3,c)= 0;        %placing 0
   I(r+3,c+1)= 0;       %placing 0
   I(r+3,c+2)=255;       %placing 1
   I(r+3,c+3)= 255;      %placing 1
  end 
end
end


%%matching grey level
for l= 17:32:256
    for o= l:1:l+15
    for m= 1:1:256
        I(o,m)=100;
    end    
    end    
end

K = mat2gray(I);  %output function

figure
imshow(K)