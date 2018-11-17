function difference = Count_Difference(StandardImage,TransfromedImage, height, width)
difference = StandardImage;
count = zeros(5,1);
for i = 1:height
    for j = 1:width
        difference(i,j) = abs(StandardImage(i,j) - TransfromedImage(i,j)) * 100;
        for k = 1:5
            if abs(StandardImage(i,j) - TransfromedImage(i,j)) < k
                count(k,1) = count(k,1)  + 1;
            end
        end
    end
end
count = count/((height*width));
display(count);