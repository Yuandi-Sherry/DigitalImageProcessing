function statisticResult = Count_Occurency(OriginalImage, height, width)
statisticResult = zeros(256,1);
for i = 1:height
    for j = 1:width
        statisticResult(OriginalImage(i,j) + 1, 1) = statisticResult(OriginalImage(i,j) + 1, 1)+1;
    end
end
statisticResult = statisticResult/(height*width);
% ��õ�Statistic�����귶ΧΪ1-256


