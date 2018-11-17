%��ȡͼ��
Lena =  imread('LENA.png');
OriginalImage = imread('EightAM.png');

%���ڲ���ͼ����Ϊ�ڰף��˴���ȥ�Ҷ�ת������

%���LENAͼ���ֱ��ͼ�ͺ���G
[height1, width1, channels] = size(Lena);
LenaHistogram = Count_Occurency(Lena,height1,width1);
LenaFunctionT = Histogram_Equalization(LenaHistogram,height1,width1);
figure(1)
bar(LenaHistogram)
title('LENA��ֱ��ͼ')
hold on;

%���EAͼ���ֱ��ͼ�ͺ���T
[height2, width2, channels] = size(OriginalImage);
OriginalHistogram = Count_Occurency(OriginalImage,height2,width2);
OriginalFunctionT = Histogram_Equalization(OriginalHistogram,height2,width2);
% OriginalHistogram(255,1) = 0
figure(2);
bar(OriginalHistogram);
title('ԭͼ��ֱ��ͼ')
hold on;

% Originalֱ��ͼ���⻯
OriginalAfterHistoEqImg = Transform(OriginalImage,height2,width2, OriginalFunctionT);
figure(3);
imwrite(OriginalAfterHistoEqImg, 'EAƥ��ǰͼ��.jpg')
imshow(OriginalAfterHistoEqImg)
title('EAƥ��ǰͼ��')
hold on;
HistoEqImgHistogram = Count_Occurency(OriginalAfterHistoEqImg,height2,width2);
% HistoEqImgHistogram(255,1) = 0;
figure(4);
bar(HistoEqImgHistogram);
title('EAƥ��ǰֱ��ͼ')
hold on;

% Originalֱ��ͼƥ��
InverseLenaT = getInverseFunction(LenaFunctionT);
OriginalAfterStandImg = Transform(OriginalAfterHistoEqImg,height2,width2, InverseLenaT);
imwrite(OriginalAfterStandImg, 'EAƥ���ͼ��.jpg')
figure(5)
imshow(OriginalAfterStandImg);
title('EAƥ���ͼ��')
hold on;

% ƥ��֮���ֱ��ͼ
StanHistogram = Count_Occurency(OriginalAfterStandImg,height2,width2);
% StanHistogram(219,1) = 0;
figure(6);
bar(StanHistogram);
title('EAƥ���ֱ��ͼ')