% read the image
img = imread('barb.png');
img = double(img);
[height, width] = size(img);

figure(1)
imshow(img,[]),title('ԭͼ');

% centralize the image
[y,x] = meshgrid(1:height, 1:width);
imgCenter = img.*(-1).^(x+y);

figure(2)
imshow(imgCenter,[]), title('�ƶ������ĵ�ͼ��');
% FFT
imgAfterFFT = fft2(imgCenter);
figure(3)
% imshow(log(1+abs(imgAfterFFT)),[]), title('FFT�任���');

% apply BW trans
d0 = [10, 20, 40, 80];
for i = 1:4
    imgAfterBW = Butterworth(imgAfterFFT, d0(i));
    % DFT and select real part
    imgAfterDFT = real(ifft2(imgAfterBW));
    title('DFT���任����');
    figure(5)
%     imshow(imgAfterDFT,[]);
    % �����ı任
    ans = imgAfterDFT.*(-1).^(x+y);
    title('���ս��');
    figure(6)
    savedName = strcat('BWLPF',num2str(d0(i)));
    savedName = strcat(savedName,'.png');
    imwrite(mat2gray(ans),savedName);
end

