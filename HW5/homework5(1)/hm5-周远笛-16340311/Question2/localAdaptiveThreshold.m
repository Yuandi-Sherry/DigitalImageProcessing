function result = localAdaptiveThreshold(img, deltaT)
% 确定T的初始值
T0 = globalThreshold(img, deltaT);
[height, width] = size(img);
result = zeros(height, width);
for i = 1:height
    sumLine = 0;
    for j = 1:width
        sumLine = sumLine + img(i,j);
        if(j < width*0.15)
            if(i < height*0.15)
                if(img(i,j) < T0)
                    result(i,j) = 0;
                else
                    result(i,j) = 255;
                end
            else
                if(img(i,j) < sum(img(1:i,j))/i * 0.85)
                    result(i,j) = 0;
                else
                    result(i,j) = 255;
                end
            end
        else
            if(img(i,j) < sumLine/j * 0.85)
                result(i,j) = 0;
            else
                result(i,j) = 255;
            end
        end
    end
end
% imshow(result)