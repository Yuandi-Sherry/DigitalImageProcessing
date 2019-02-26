% read the image
img = imread('book_cover.jpg');
img = double(img);

% get degrading function
H = HGenerator(img,0.1,0.1,1);

% motion blur
motionblurredImg = MotionBlurringFilter(img, H);
figure(1)
imshow(motionblurredImg,[]);

% Gaussian Blur
GaussianBlurredImg = GaussianBlurring(motionblurredImg);
figure(2)
imshow(GaussianBlurredImg,[]);

% Inverse Filter
delta = [1, 0.1, 0.05, 0.01];
h = figure(3);
set(h,'name','Inverse Filter','Numbertitle','on')
for i = 1:4
    InverseFilteredBlurredImg = InverseFilter(GaussianBlurredImg,H,delta(i));
    subplot(2,2,i);
    imshow(InverseFilteredBlurredImg,[]);
    title(strcat('delta=', num2str(delta(i))));
end

h = figure(4);
set(h,'name','Inverse Filter','Numbertitle','on')
 InverseFilteredBlurredImg = InverseFilter(motionblurredImg,H,0.05);
subplot(2,1,1);
imshow(InverseFilteredBlurredImg,[]);
title('Restored Blurred Image');
InverseFilteredBlurredNoisyImg = InverseFilter(GaussianBlurredImg,H,0.05);
subplot(2,1,2);
imshow(InverseFilteredBlurredNoisyImg,[]);
title('Restored Blurred Noisy Image');

% Wiener Filter
K = [0.005, 0.01, 0.02, 0.03];
h = figure(5);
set(h,'name','Wiener Filter','Numbertitle','on')
for i  = 1:4
    WienerFilteredImg = WienerFilter(GaussianBlurredImg, H, K(i));
    subplot(2,2,i);
    imshow(WienerFilteredImg,[]);
    title(strcat('K=',num2str(K(i))));
end