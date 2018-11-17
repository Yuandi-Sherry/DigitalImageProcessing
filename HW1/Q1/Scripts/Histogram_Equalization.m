function Histogram = Histogram_Equalization(statisticResult,height,width)
Histogram = zeros(256,1);
for i = 1:256
    temp = 0;
    for j = 1:i
        temp = temp + statisticResult(j,1);
    end
    if(round(255*temp) + 1 > 256)
        Histogram(i,1) = 256;
    else
        Histogram(i,1) = round(255*temp) + 1;
    end
end
% 获得的Statistic为1-256 -> 1-256
