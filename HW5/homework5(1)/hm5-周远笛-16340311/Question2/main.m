img1 = double(imread('blobz1.png'));
% get the threshold
t = globalThreshold(img1, 5);
% show the result
[height, width] = size(img1);
for i = 1:height
    for j = 1:width
        if(img1(i,j) > t)
            img1(i,j) = 255;
        else
            img1(i,j) = 0;
        end 
    end
end

subplot(1,3,1);
imshow(img1);
title('bloz1');

img2 = double(imread('blobz2.png'));
resultImg = localAdaptiveThreshold(img2, 4);

subplot(1,3,3);
imshow(resultImg);
title('bloz2 - local adaptive threshold');
% get the threshold
t = globalThreshold(img2, 1);
% show the result
[height, width] = size(img2);
for i = 1:height
    for j = 1:width
        if(img2(i,j) > t)
            img2(i,j) = 255;
        else
            img2(i,j) = 0;
        end 
    end
end
subplot(1,3,2)
imshow(img2);
title('bloz2 - global threshold');