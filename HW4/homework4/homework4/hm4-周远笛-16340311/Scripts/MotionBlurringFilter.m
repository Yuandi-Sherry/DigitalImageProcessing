function motionblurredImg = MotionBlurringFilter(img, H)
[height, width, channels] = size(img);
imgFFT = CentralizeTrans(img);
imgFFT = fft2(imgFFT);
motionblurredImgFFT = H.*imgFFT;
motionblurredImg = real(ifft2(motionblurredImgFFT));
motionblurredImg = CentralizeTrans(motionblurredImg);