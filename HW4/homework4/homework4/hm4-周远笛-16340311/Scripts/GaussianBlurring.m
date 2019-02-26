function GaussianBlurredImg = GaussianBlurring(img)
[height, width, channels] = size(img);
N = normrnd(0, sqrt(500),height,width);
GaussianBlurredImg = img + N;