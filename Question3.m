

close all; %close all previous opened windows
clear all; % clear worispace


 read_data;% this creates vector X


meanofvector = mean(X,2); %  returns the mean along dimension dim. For example, if A is a matrix, then mean(A,2) is a column vector containing the mean of each row.


[m,n] = size(X); % calculates size of the vector formed


variable_Z = zeros(m,n); % forms a matrice variable_Z with the dimensions of X but having all zeros


% compute the eigenvalues and eigenvectors of the image covariance for this data set


variable_Z = (1/sqrt(n-1))*(bsxfun(@minus,X,meanofvector)); %bsxfun subtracts the mean from the vector X which contains the image data and then the result of the previous function is multiplied by (1/sqrt(n-1)) which calculates the covariance 


[U,S,V] = svd(variable_Z,0); % SVD gives us the eigenvectors and eigenvalues that we need for PCA




% Loop for displaying first 12 Eigen Images
for i=1:12 
    
   
                temp_image=reshape(U(:,i),64,64); % reshape each image column vector into a 64 × 64 image matrix. Because Each Image in the training set are of dimension 64 x 64
                
                
                    figure(1);
                    
                    subplot(4,3,i); % To display each of the 12 images side by side in a single window in 4 rows and 3 columns
                    
                    imagesc(temp_image); % To automatically scale the displayed gray level range,
                    
                    axis('image');
                    
                    colormap(gray(256));% To use a grayscale colormap
                
                
                title(strcat('eigenvalue',num2str(i))); % To Display title of the window
                
                
end


% computes Ytemp = (transpose of U with base m) multiplied by the image equation (24) in PCA.pdf 
Ytemp = U'*(bsxfun(@minus,X,meanofvector)); % for each of the images in the centered data set we compute the projection coefficients

figure(2);


% Loop to plot the first 10 projection coefficients for the first four
% images A,B,C,D and form 4 different graphs
for i = 1:4
    
    
                        plot(1:10,Ytemp(1:10,i));
                       
                        
                        hold on;
    
    
end


legend('a','b','c','d'); % command to identify each of the 4 graphs

xlabel('X number'); % to label x-axis

ylabel('Projection value'); % to label y-axis




% Select your desired character to resynthesize and print
character_selector = 4 ; % a = 1, b = 2, c = 3, d = 4




% Block of code to show for which image in the data set we are going to
% show the resynthezised results
%%%%%%%%%%%%%%%%%%%%%%%%%%%
temp_image = reshape(X(:,character_selector),64,64);  


figure(3);


imagesc(temp_image);


axis('image'); colormap(gray(256));

%%%%%%%%%%%%%%%%%%%%%%%%%%%







m_vector = 1; % for the first m-vector


% Loop for performing resynthesizing(data reduction) of the Original Image using only the
% first m-vectors
for i = [1 5 10 15 20 30]
    
    
            % Multiplies U base m with Ytemp to obtain an approximation of the original image from a linear combination of the eigen images. 
            % Where M has values [1,5,10,15,20,30]. Use of this approximation is commonly referred to as principal component analysis, or PCA.
            % Equation (25) in PCA.pdf
            var = U(:,character_selector:i)*Ytemp(character_selector:i,:);   
	
            
            img_restore = bsxfun(@plus,var,meanofvector); % adds the mean back to the answer calculated previously
	
           
            temp_image = reshape(img_restore(:,character_selector),64,64); % reshape the image column vectors back into a matrix
    
	
            
            % Block of code to display the results
            %%%%%%%%%%%%%%%%%%%%%%%%%%
            figure(4);
            
            subplot(3,2,m_vector); %  image to display the six synthesized versions in a single window
            
            image(temp_image);
            
            
            title(strcat('a from  ',num2str(i),' Xs')); % change for a,b,c,d used for title only
            
            axis('image');
            
            colormap(gray(256));
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
            %Condition to terminate loop
            m_vector = m_vector+1;
            
            
end
