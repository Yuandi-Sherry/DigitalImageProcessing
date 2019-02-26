function H = HGenerator(img,a,b,T)
[height, width, channels] = size(img);
H = zeros(height, width);
for u = 1:height
    for v = 1:width
        H(u,v) = (T/(pi*((u-height/2)*a+(v-width/2)*b)))*sin(pi*((u-height/2)*a+(v-width/2)*b))*exp(-i*pi*((u-height/2)*a+(v-width/2)*b));
        if isnan(H(u,v)) == 1
            H(u,v) = 1;
        end
    end
end
end