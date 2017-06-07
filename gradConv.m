I = imread('Baboon.bmp');
subplot(2,2,1);imshow(I);

filterx = [0 0 0;1 -1 0;0 0 0];%filter x
filtery = [0 0 0;0 -1 0;0 1 0];%filter y

I = double(I);
newIx = conv2(I,filterx);
newIy = conv2(I,filtery);

%creating gradient image
newIxy = zeros(size(I));

for x=1:size(I,1)
    for y=1:size(I,2)
        newIxy(x,y) = sqrt(newIx(x,y)^2 + newIy(x,y)^2);% (x^2+y^2)^(1/2) = gradient
    end
end

newIx = uint8(newIx);
newIy = uint8(newIy);
newIxy = uint8(newIxy);

subplot(2,2,2);imshow(newIxy);
subplot(2,2,3);imshow(newIx);
subplot(2,2,4);imshow(newIy);


