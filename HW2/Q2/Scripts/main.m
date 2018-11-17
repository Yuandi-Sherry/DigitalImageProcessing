% ��ȡͼ��
img = imread('sport car.pgm');
[height, width] = size(img);
% imshow(img);
% �������������ġ�������[0, 255]�ھ��ȷֲ����������
t1 = 255 * rand(height,width); 
t2 = 255 * rand(height,width); 
% ������������ͼ��
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
% ����3*3����ʵ����ֵ�˲�
result = MedianFilter(saltAndPepper);
% imshow(result);
% �Ͳ���medfilt2�Ľ���Ƚ�
standard = medfilt2(saltAndPepper);
% imshow(standard);
difference = (result - double(standard) + 255)/2;
% imshow(difference);

% ͼ����ʾ
figure(1)
imshow(img)
title('ԭʼͼ��')

figure(2)
imshow(saltAndPepper)
title('��������ͼ��')
imwrite(saltAndPepper, 'HW2\Q2\Results\saltAndPepper.jpg')

figure(3)
imshow(result)
title('��ֵ�˲�ͼ��')
imwrite(result, 'HW2\Q2\Results\ManualResult.jpg')

figure(4)
imshow(standard)
title('����Matlab��medfilt2���Ľ��')