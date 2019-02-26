function result = Content(k, l, f, h, i, j)
result = 0;
f = double(f);
h = double(h);
for u = -1*k:k
    for v = -1*l:l
        result = result + f(i-u, j-v) * f(i-u, j-v);
    end
end
