function imgAfterBW = Butterword(imgAfterFFT, D0)
% inutialize
[height, width] = size(imgAfterFFT);
imgAfterBW = zeros(height,width);
% generate H(u,v)
centerX = floor(height/2);
centerY = floor(width/2);

for i = 1:height
    for j = 1:width
        imgAfterBW(i,j) = imgAfterFFT(i,j)* 1/(1+((i- centerX)^2+(j-centerY)^2)/D0^2);
    end
end
title('butterworthÂË²¨½á¹ûÆµÆ×');
figure(4)
savedName = strcat('BWspectrum',num2str(D0));
savedName = strcat(savedName, '.jpg');
% test = getimage(h);
% imwrite(test/255,'imageoutput.tif');
imwrite(mat2gray(log(1+abs(imgAfterBW))), savedName);