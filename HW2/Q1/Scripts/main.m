%��ȡͼ��
img = imread('car.png');
[imgHeight, imgWidth, channels] = size(img);
% imshow(img);
%��ȡģ��
pattern = imread('wheel.png');
[patHeight, patWidth, channels] = size(pattern);
%�½�Correlation map
[paddingImg, CorrelationMap] = PatternDetect(img, pattern);
%����ģ���⣬���ģ������ͼ������λ�õ�����
[x,y] = find(CorrelationMap == max(max(CorrelationMap)));
%��ͼ����Ȧ��ģ��
x = x-floor(patHeight/2);
y = y-floor(patWidth/2);
color = 255;
for i = x-floor(patHeight/2)-1: x+floor(patHeight/2)+1
   j = y-floor(patWidth/2)-1;
   img(i,j) = color;
   j = y+floor(patWidth/2)+1;
   img(i,j) = color;
end

 for j = y-floor(patWidth/2)-1:y+floor(patWidth/2)+1
    i = x-floor(patHeight/2)-1;
    img(i,j) = color;
    i = x+floor(patHeight/2)+1;
    img(i,j) = color;    
 end
 
% ͼ����ʾ
figure(1)
imshow(CorrelationMap/4000)
title('Correlation Map')
% imwrite(CorrelationMap/4000, 'HW2\Q1\Results\CorrelationMap.jpg')

figure(2)
imshow(img)
title('ƥ����')
% imwrite(img, 'HW2\Q1\Results\result.jpg')
