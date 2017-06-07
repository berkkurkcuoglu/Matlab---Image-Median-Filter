I = imread('lion2.jpg');
fSize = 3;
padding = (fSize-1)/2; %padding size
filterx = [0 0 0;0 -1 1;0 0 0];%filter x with convolution
filtery = [0 1 0;0 -1 0;0 0 0];%filter y with convolution
iPad = zeros(size(I) + padding*2); % image with padding

%copying original image to the new image with padding
for x=1:size(I,1)
    for y=1:size(I,2)
        iPad(x+padding,y+padding) = I(x,y);
    end
end

newIx = zeros(size(I));
newIy = zeros(size(I));
newIxy = zeros(size(I));

%applying filter to the image
for k=1:size(I,1)
    for l=1:size(I,2)
        sumx=0;
        sumy=0;
        for x=1:fSize
            for y=1:fSize                
                sumx = sumx + iPad(k+x-1,l+y-1)*filterx(x,y);%applying x filter to the image
                sumy = sumy + iPad(k+x-1,l+y-1)*filtery(x,y);%applying y filter to the image
            end
        end        
        newIx(k,l) = sumx;%assigning filtered values to new image
        newIy(k,l) = sumy;%assigning filtered values to new image
    end
end

%creating gradient image
for x=1:size(I,1)
    for y=1:size(I,2)
        newIxy(x,y) = sqrt(newIx(x,y)^2 + newIy(x,y)^2);% (x^2+y^2)^(1/2) = gradient
    end
end

newIx = uint8(newIx);
newIy = uint8(newIy);
newIxy = uint8(newIxy);

subplot(2,2,1);imshow(I);
subplot(2,2,2);imshow(newIxy);
subplot(2,2,3);imshow(newIx);
subplot(2,2,4);imshow(newIy);


