function ans = CentralizeTrans(img)
[height, width, channel] = size(img);
ans = zeros(height, width);
for i = 1:height
    for j = 1:width
        ans(i,j) = img(i,j) * (-1)^(i+j);
    end
end
