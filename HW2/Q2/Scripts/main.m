% 读取图像
img = imread('sport car.pgm');
[height, width] = size(img);
% imshow(img);
% 产生两个独立的、在区间[0, 255]内均匀分布的随机矩阵
t1 = 255 * rand(height,width); 
t2 = 255 * rand(height,width); 
% 产生椒盐噪声图像
saltAndPepper = img;
% imshow(saltAndPepper);
for i = 1: height
    for j = 1 : width
        if img(i,j) > t1(i,j)
            saltAndPepper(i,j) = 255;
        elseif img(i,j) < t2(i,j)
            saltAndPepper(i,j) = 0;
        end
    end
end
% imshow(saltAndPepper);
% 采用3*3窗口实现中值滤波
result = MedianFilter(saltAndPepper);
% imshow(result);
% 和采用medfilt2的结果比较
standard = medfilt2(saltAndPepper);
% imshow(standard);
difference = (result - double(standard) + 255)/2;
% imshow(difference);

% 图像显示
figure(1)
imshow(img)
title('原始图像')

figure(2)
imshow(saltAndPepper)
title('椒盐噪声图像')
imwrite(saltAndPepper, 'HW2\Q2\Results\saltAndPepper.jpg')

figure(3)
imshow(result)
title('中值滤波图像')
imwrite(result, 'HW2\Q2\Results\ManualResult.jpg')

figure(4)
imshow(standard)
title('采用Matlab‘medfilt2’的结果')