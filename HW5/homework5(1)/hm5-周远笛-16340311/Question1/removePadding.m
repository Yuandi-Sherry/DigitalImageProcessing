function restoredMat = padding(originMat, kernel, origin)
% 获得矩阵和模板大小
[matHeight, matWidth] = size(originMat);
[kerHeight, kerWidth] = size(kernel);
restoredMat = zeros(matHeight, matWidth);
for i = 1:matHeight - kerHeight + 1
    for j = 1:matWidth - kerWidth + 1
        restoredMat(i,j) = originMat(i + origin(1) - 1,j + origin(2) - 1);
    end;
end
% display(paddedMatrix);
