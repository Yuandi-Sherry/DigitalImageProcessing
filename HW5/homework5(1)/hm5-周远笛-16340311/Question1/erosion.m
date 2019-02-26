function erosionMat = erosion(paddedMat, kernel, origin)
% 获得矩阵和模板大小
[matHeight, matWidth] = size(paddedMat);
[kerHeight, kerWidth] = size(kernel);
% 找到模板在矩阵中对应的第一个原点的位置
% 遍历paddedMat
erosionMat = zeros(matHeight - kerHeight + 1, matWidth - kerWidth + 1);
% 记录模板中1的个数
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
%         遍历kernel中的点
        for p = i + 1 - origin(1) :  i - origin(1)+kerHeight
            for q = j + 1 - origin(2) :  j - origin(2)+kerWidth
%                 kernel中为1，且kernel对应的矩阵也为1
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