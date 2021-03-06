% read the image
img = imread('office.jpg');
[height, width, channel] = size(img);
figure(1)
imshow(img,[]),title('原图');
img = double(img);

% ln and centralize the image
img = log(img + 1);
imgCenter = CentralizeTrans(img);
figure(2)
% imshow(imgCenter,[]), title('移动到中心的图像');

% FFT
imgAfterFFT = fft2(imgCenter);
figure(3)
% imshow(imgAfterFFT,[]), title('FFT变换后频谱');

% apply Homomorphic filtering
% find Best D0
for d = 5:1:15
    imgAfterH = Homomorphic(imgAfterFFT, 2, 0.25, 1, d);

    % DFT and select real part
    imgAfterDFT = real(ifft2(imgAfterH));
    figure(5)
%     imshow(imgAfterDFT,[]),title('DFT反变换后结果');

    % decentralize and exp
    ans = exp(CentralizeTrans(imgAfterDFT))-1;
    % enhance
    enhance = Enhancement(ans);
    figure(7)
%     imshow(enhance,[]), title('增强结果');
    savedName = strcat('HResult', num2str(d));
    savedName = strcat(savedName, '.jpg');
    imwrite(enhance,savedName);
end

img = imread('office.jpg');
img = double(img);
imgCenter = CentralizeTrans(img);
imgAfterFFT = fft2(imgCenter);

for d = 1:10:100
    imgAfterH = BWHPF(imgAfterFFT, 2, 0.25, 1, d);
    imgAfterDFT = CentralizeTrans(real(ifft2(imgAfterH)));
    enhance = Enhancement(imgAfterDFT);
    savedName = strcat('BWHPFresult', num2str(d));
    savedName = strcat(savedName, '.jpg');
    imwrite(mat2gray(enhance),savedName);
end