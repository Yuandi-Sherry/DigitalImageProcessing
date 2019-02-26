function dilationMat = dilation(paddedMat, kernel, origin)
% 获得矩阵和模板大小
[matHeight, matWidth] = size(paddedMat);
[kerHeight, kerWidth] = size(kernel);
% 找到模板在矩阵中对应的第一个原点的位置
% 遍历paddedMat
dilationMat = zeros(matHeight - kerHeight + 1, matWidth - kerWidth + 1);
for i = origin(1): matHeight - kerHeight + 1
    for j = origin(2): matWidth - kerWidth + 1
%         遍历kernel中的点在补全的图像中对应的位置
        for p = i + 1 - origin(1) :  i - origin(1)+kerHeight
            for q = j + 1 - origin(2) :  j - origin(2)+kerWidth
                if(paddedMat(p,q) == kernel(p+1-i, q+origin(2)-j) && kernel(p+1-i, q+origin(2)-j) == 1)
                    dilationMat(i,j) = 1;
                end
            end
        end
    end
end