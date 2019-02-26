function dilationMat = dilation(paddedMat, kernel, origin)
% ��þ����ģ���С
[matHeight, matWidth] = size(paddedMat);
[kerHeight, kerWidth] = size(kernel);
% �ҵ�ģ���ھ����ж�Ӧ�ĵ�һ��ԭ���λ��
% ����paddedMat
dilationMat = zeros(matHeight - kerHeight + 1, matWidth - kerWidth + 1);
for i = origin(1): matHeight - kerHeight + 1
    for j = origin(2): matWidth - kerWidth + 1
%         ����kernel�еĵ��ڲ�ȫ��ͼ���ж�Ӧ��λ��
        for p = i + 1 - origin(1) :  i - origin(1)+kerHeight
            for q = j + 1 - origin(2) :  j - origin(2)+kerWidth
                if(paddedMat(p,q) == kernel(p+1-i, q+origin(2)-j) && kernel(p+1-i, q+origin(2)-j) == 1)
                    dilationMat(i,j) = 1;
                end
            end
        end
    end
end