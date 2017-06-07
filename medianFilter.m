I = imread('Cameraman3.bmp');
fSize = 7; % filter size -> 3 5 7
padding = (fSize-1)/2; %padding size
medArray = zeros(fSize,fSize);
iPad = zeros(size(I) + padding*2); % image with padding

%copying original image to the new image with padding
for x=1:size(I,1)
    for y=1:size(I,2)
        iPad(x+padding,y+padding) = I(x,y);
    end
end

newI = zeros(size(I));

%applying filter to the image
for k=1:size(I,1)
    for l=1:size(I,2)              
        for x=1:fSize
            for y=1:fSize                
                medArray(x,y) = iPad(k+x-1,l+y-1); %adding values to filter array              
            end
        end         
        sortedArray = sort(medArray(:)); %sorting filter array
        newI(k,l) = sortedArray((fSize^2+1)/2);  %getting median of the array    
    end
end

newI = uint8(newI);

subplot(1,2,1);imshow(I);
subplot(1,2,2);imshow(newI);



