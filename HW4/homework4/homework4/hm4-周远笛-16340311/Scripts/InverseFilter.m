function restoredImg = InverseFilter(img, H, delta)
[height, width, channels] = size(img);
imgFFT = CentralizeTrans(img);
imgFFT = fft2(imgFFT);
Hinverse = zeros(height, width);
for u = 1:height
%     display(u);
    for v = 1:width
        if abs(H(u,v)) < delta
            Hinverse(u,v) = 0;
        else
            Hinverse(u,v) = 1/H(u,v);
        end
    end
end
restoredImgFFT = imgFFT.*Hinverse;
restoredImg = real(ifft2(restoredImgFFT));
restoredImg = CentralizeTrans(restoredImg);
end