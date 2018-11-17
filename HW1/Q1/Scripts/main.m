%读取图像
%由于测试图像本身为黑白，此处略去灰度转化步骤
OriginalImage = imread('river.JPG');
%imshow(OriginalImage);

[height, width, channels] = size(OriginalImage);

statisticResult = Count_Occurency(OriginalImage,height,width);
figure(1)
title('原图像直方图')
bar(statisticResult);
hold on
% 
Histogram = Histogram_Equalization(statisticResult,height,width);
figure(2)
plot(Histogram)
title('变换函数T(r)')
hold on

TransfromedImage = Transform(OriginalImage,height,width, Histogram);
figure(3)
imshow(TransfromedImage);
title('直方图均衡化之后得到的图像')
hold on

resultHistogram = Count_Occurency(TransfromedImage,height,width);
figure(4)
bar(resultHistogram, 0.5)
title('直方图均衡化之后得到的直方图')
imwrite(TransfromedImage, 'TransfromedImage.jpg')

StandardImage = histeq(OriginalImage, 256);
figure(5)
imshow(StandardImage);
title('系统直方图均衡化图像')

StandardHistogram = Count_Occurency(StandardImage, height, width);
figure(6)
bar(StandardHistogram, 0.5);
title('系统直方图均衡化之后得到的直方图')

difference = resultHistogram -StandardHistogram;
% display(StandardHistogram(0));
figure(7)
bar(difference);
title('标准函数获得图像的直方图与自己均衡化的直方图作差结果')

difference = Count_Difference(TransfromedImage,StandardImage,height,width);
figure(8)
imshow(difference);
title('difference')
imwrite(difference, 'difference.jpg')