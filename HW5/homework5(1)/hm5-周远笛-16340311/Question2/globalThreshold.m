function t = globalThreshold(img, deltaT)
% 确定T的初始值
T0 = 0;
t = median(median(img));
[height, width] = size(img);
while(abs(t-T0) > deltaT)
    
    T0 = t;
    display(T0)
    G1sum = 0;
    G1count = 0;
    G2sum = 0;
    G2count = 0;
    for i = 1:height
        for j = 1:width
            if(img(i,j) > T0)
                G1sum = G1sum + img(i,j);
                G1count = G1count + 1;
            else
                G2sum = G2sum + img(i,j);
                G2count = G2count + 1;
            end 
        end
    end
    t = 0.5 * (G1sum/G1count + G2sum/G2count);
end