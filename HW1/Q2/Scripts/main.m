%读取图像
Lena =  imread('LENA.png');
OriginalImage = imread('EightAM.png');

%由于测试图像本身为黑白，此处略去灰度转化步骤

%获得LENA图像的直方图和函数G
[height1, width1, channels] = size(Lena);
LenaHistogram = Count_Occurency(Lena,height1,width1);
LenaFunctionT = Histogram_Equalization(LenaHistogram,height1,width1);
figure(1)
bar(LenaHistogram)
title('LENA的直方图')
hold on;

%获得EA图像的直方图和函数T
[height2, width2, channels] = size(OriginalImage);
OriginalHistogram = Count_Occurency(OriginalImage,height2,width2);
OriginalFunctionT = Histogram_Equalization(OriginalHistogram,height2,width2);
% OriginalHistogram(255,1) = 0
figure(2);
bar(OriginalHistogram);
title('原图的直方图')
hold on;

% Original直方图均衡化
OriginalAfterHistoEqImg = Transform(OriginalImage,height2,width2, OriginalFunctionT);
figure(3);
imwrite(OriginalAfterHistoEqImg, 'EA匹配前图像.jpg')
imshow(OriginalAfterHistoEqImg)
title('EA匹配前图像')
hold on;
HistoEqImgHistogram = Count_Occurency(OriginalAfterHistoEqImg,height2,width2);
% HistoEqImgHistogram(255,1) = 0;
figure(4);
bar(HistoEqImgHistogram);
title('EA匹配前直方图')
hold on;

% Original直方图匹配
InverseLenaT = getInverseFunction(LenaFunctionT);
OriginalAfterStandImg = Transform(OriginalAfterHistoEqImg,height2,width2, InverseLenaT);
imwrite(OriginalAfterStandImg, 'EA匹配后图像.jpg')
figure(5)
imshow(OriginalAfterStandImg);
title('EA匹配后图像')
hold on;

% 匹配之后的直方图
StanHistogram = Count_Occurency(OriginalAfterStandImg,height2,width2);
% StanHistogram(219,1) = 0;
figure(6);
bar(StanHistogram);
title('EA匹配后直方图')