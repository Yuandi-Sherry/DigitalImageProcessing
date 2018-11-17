%��ȡͼ��
img = imread('car.png');
[imgHeight, imgWidth, channels] = size(img);
% imshow(img);
%��ȡģ��
pattern = imread('wheel.png');
[patHeight, patWidth, channels] = size(pattern);
%�½�Correlation map
[paddingImg, CorrelationMap] = PatternDetect(img, pattern);
imshow(CorrelationMap);
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

imshow(img);
imwrite(img, 'HW2\Q1\Results\result1.jpg')