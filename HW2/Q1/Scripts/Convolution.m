function result = Content(f, h, i, j, k, l);
result = 0;
for u = -1*k:k
    for v = -1*l:l
        result = result + f(i-u, j-v)* h(i-u, j-v);
    end
end
