% ��ȡͼ��
img = imread('sport car.pgm');
[height, width] = size(img);
% �������������ġ�������[0, 255]�ھ��ȷֲ����������
t1 = 255 * rand(height,width); 
t2 = 255 * rand(height,width); 
% ������������ͼ��
saltAndPepper = img;
for i = 1: height
    for j = 1 : width
        if img(i,j) > t1(i,j)
            saltAndPepper(i,j) = 255;
        elseif img(i,j) < t2(i,j)
            saltAndPepper(i,j) = 0;
        end
    end
end
% ����3*3����ʵ����ֵ�˲�
result = uint8(MedianFilter(saltAndPepper));
% �Ͳ���medfilt2�Ľ���Ƚ�
standard = medfilt2(saltAndPepper);
difference = result - standard;
count = 0;
for i = 1:height
    for j = 1:width
        if difference(i,j)~= 0
            count = count + 1;
        end
    end
end


% ͼ����ʾ
figure(1)
imshow(img)
title('ԭʼͼ��')

figure(2)
imshow(saltAndPepper)
title('��������ͼ��')
% imwrite(saltAndPepper, 'HW2\Q2\Results\saltAndPepper.jpg')

figure(3)
imshow(result)
title('��ֵ�˲�ͼ��')
% imwrite(result, 'HW2\Q2\Results\ManualResult.jpg')

figure(4)
imshow(standard)
title('����Matlab��medfilt2���Ľ��')

figure(5)
imshow(difference/256)
title('��������Ĳ��')
% imwrite(difference, 'HW2\Q2\Results\Difference.jpg')
