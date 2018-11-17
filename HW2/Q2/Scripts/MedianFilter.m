function result = MedianFilter(img)
[height, width] = size(img);
result = zeros(height, width);
List = zeros(9,1);
for i = 2: height -1
    for j = 2 : width-1
        index = 1;
        for p = i - 1 : i + 1
            for q = j - 1: j+1
                List(index,1) = img(p, q);
                index = index+1;
            end
        end
        List = sort(List);
        result(i,j) = List(4);
    end
end
