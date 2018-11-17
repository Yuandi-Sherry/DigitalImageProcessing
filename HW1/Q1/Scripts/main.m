%��ȡͼ��
%���ڲ���ͼ����Ϊ�ڰף��˴���ȥ�Ҷ�ת������
OriginalImage = imread('river.JPG');
%imshow(OriginalImage);

[height, width, channels] = size(OriginalImage);

statisticResult = Count_Occurency(OriginalImage,height,width);
figure(1)
title('ԭͼ��ֱ��ͼ')
bar(statisticResult);
hold on
% 
Histogram = Histogram_Equalization(statisticResult,height,width);
figure(2)
plot(Histogram)
title('�任����T(r)')
hold on

TransfromedImage = Transform(OriginalImage,height,width, Histogram);
figure(3)
imshow(TransfromedImage);
title('ֱ��ͼ���⻯֮��õ���ͼ��')
hold on

resultHistogram = Count_Occurency(TransfromedImage,height,width);
figure(4)
bar(resultHistogram, 0.5)
title('ֱ��ͼ���⻯֮��õ���ֱ��ͼ')
imwrite(TransfromedImage, 'TransfromedImage.jpg')

StandardImage = histeq(OriginalImage, 256);
figure(5)
imshow(StandardImage);
title('ϵͳֱ��ͼ���⻯ͼ��')

StandardHistogram = Count_Occurency(StandardImage, height, width);
figure(6)
bar(StandardHistogram, 0.5);
title('ϵͳֱ��ͼ���⻯֮��õ���ֱ��ͼ')

difference = resultHistogram -StandardHistogram;
% display(StandardHistogram(0));
figure(7)
bar(difference);
title('��׼�������ͼ���ֱ��ͼ���Լ����⻯��ֱ��ͼ������')

difference = Count_Difference(TransfromedImage,StandardImage,height,width);
figure(8)
imshow(difference);
title('difference')
imwrite(difference, 'difference.jpg')