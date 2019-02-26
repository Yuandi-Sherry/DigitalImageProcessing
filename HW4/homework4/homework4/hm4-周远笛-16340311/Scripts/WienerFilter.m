function restoredImg = WienerFilter(img, H,K)
[height, width, channels] = size(img);
imgFFT = CentralizeTrans(img);
imgFFT = fft2(imgFFT);
Hwin = zeros(height, width);
for u = 1:height
%     display(u);
    for v = 1:width
        Hwin(u,v) = abs(H(u,v)^2)/(abs(H(u,v)^2)+K)/H(u,v);
    end
end
restoredImgFFT = imgFFT.*Hwin;
restoredImg = real(ifft2(restoredImgFFT));
restoredImg = CentralizeTrans(restoredImg);
end