function erosionMat = erosion(paddedMat, kernel, origin)
% ��þ����ģ���С
[matHeight, matWidth] = size(paddedMat);
[kerHeight, kerWidth] = size(kernel);
% �ҵ�ģ���ھ����ж�Ӧ�ĵ�һ��ԭ���λ��
% ����paddedMat
erosionMat = zeros(matHeight - kerHeight + 1, matWidth - kerWidth + 1);
% ��¼ģ����1�ĸ���
countOnes = 0;
for i = 1:kerHeight
    for j = 1:kerWidth
        if(kernel(i,j) == 1)
            countOnes = countOnes + 1;
        end
    end
end
% display(countOnes)
for i = origin(1): matHeight - kerHeight + 1
    for j = origin(2): matWidth - kerWidth + 1
        countTemp = 0;
%         ����kernel�еĵ�
        for p = i + 1 - origin(1) :  i - origin(1)+kerHeight
            for q = j + 1 - origin(2) :  j - origin(2)+kerWidth
%                 kernel��Ϊ1����kernel��Ӧ�ľ���ҲΪ1
                if(kernel(p+origin(1)-i, q+origin(2)-j) == 1 && paddedMat(p,q) == kernel(p+origin(1)-i, q+origin(2)-j))
                    countTemp = countTemp + 1;
                end
            end
        end
        if(countTemp == countOnes)
            erosionMat(i,j) = 1;
        end
    end
end