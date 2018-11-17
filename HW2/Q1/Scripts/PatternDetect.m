function [paddingImg, map] = PatternDetect(img, pattern)
[R, C, ~] = size(img);
[m, n, ~] = size(pattern);
cpad = floor(n/2);
rpad = floor(m/2);
hcorig = cpad + 1;
hrorig = rpad + 1;
paddingImg = zeros(R + m - 1, C + n - 1);
% Éú³ÉpaddingImg
for i = 1:R
    for j = 1:C
        paddingImg(i+cpad, j+rpad) = img(i,j);
    end
end
map = zeros(R + m - 1, C + n - 1);
for i = hrorig : hrorig + R - 1
    for j = hcorig : hcorig + C - 1
        map(i,j) = Correlation(floor(m/2), floor(n/2),paddingImg, pattern, i,j)/sqrt(Content(floor(m/2), floor(n/2),paddingImg, pattern, i,j));
    end
end


