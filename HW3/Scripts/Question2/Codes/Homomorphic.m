function imgAfterH = Homomorphic(imgAfterFFT, gammaH, gammaL, C, D0)
[height, width, channel] = size(imgAfterFFT);
imgAfterH = zeros(height, width);
centerX = floor(height/2);
centerY = floor(width/2);
for i = 1:height
    for j = 1:width
        D = (i- centerX)^2+(j-centerY)^2;
        imgAfterH(i,j) = imgAfterFFT(i,j) * ((gammaH - gammaL)*(1-exp(-C*(D/D0^2))) + gammaL);
%         imgAfterH(i,j) = imgAfterFFT(i,j) * (1/(1+D0^2/D^2));
    end
end
figure(4);
savedName = strcat('Hspectrum', num2str(D0));
savedName = strcat(savedName, '.jpg');
imwrite(mat2gray(log(1+abs(imgAfterH))),savedName);
% 