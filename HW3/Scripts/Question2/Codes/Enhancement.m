function enhancedImg = Enhancement(inputImg)
maxh = max(max(inputImg));
minh = min(min(inputImg));
[height, width, channel] = size(inputImg);
enhancedImg = zeros(height, width);
display(maxh);
display(minh);
for i = 1:height
    for j = 1:width
        enhancedImg(i,j) = 255 * (inputImg(i,j)-minh)/(maxh-minh); 
        end
    end
end