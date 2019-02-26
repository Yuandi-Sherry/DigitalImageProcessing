function paddedMatrix = padding(originMat, kernel, origin)
% 获得矩阵和模板大小
[matHeight, matWidth] = size(originMat);
[kerHeight, kerWidth] = size(kernel);
paddedMatrix = zeros(matHeight + kerHeight - 1, matWidth + kerWidth - 1);
for i = origin(1):origin(1)+matHeight-1
    for j = origin(2):origin(2)+matWidth-1
        paddedMatrix(i,j) = originMat(i + 1 - origin(1),j + 1 - origin(2));
    end;
end
% display(paddedMatrix);
