function TransfromedImage = Transform(OriginalImage,height,width, Histogram)
TransfromedImage = OriginalImage;
count = 0;
for i = 1:height
    for j = 1:width
        if Histogram(OriginalImage(i,j)+1,1) - 1 < 0
            TransfromedImage(i,j) = 0;
        elseif Histogram(OriginalImage(i,j)+1,1) - 1 > 255
            TransfromedImage(i,j) = 255;
        else
            TransfromedImage(i,j) = Histogram(OriginalImage(i,j)+1,1) - 1;
        end
    end
end
% 获得的Histogram为1-256 -> 0-255