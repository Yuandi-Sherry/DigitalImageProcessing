function imgAfterH = BWHPF(imgAfterFFT, gammaH, gammaL, C, D0)
[height, width, channel] = size(imgAfterFFT);
imgAfterH = zeros(height, width);
centerX = floor(height/2);
centerY = floor(width/2);
for i = 1:height
    for j = 1:width
        D = (i- centerX)^2+(j-centerY)^2;
        imgAfterH(i,j) = imgAfterFFT(i,j) * (1/(1+D0^2/D^2));
    end
end
figure(4);
savedName = strcat('BWHPFspectrum', num2str(D0));
savedName = strcat(savedName, '.jpg');
imshow(log(1+abs(imgAfterH))), title('Í¬Ì¬ÂË²¨ºóÆµÆ×'); 
imwrite(mat2gray(log(1+abs(imgAfterH))),savedName);
% 