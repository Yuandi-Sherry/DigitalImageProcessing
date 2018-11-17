function result = nestedSum(range1, range2, img, pattern, i, j);
for u = -1*range1 : range1
    for v = -1*range2 : range2
        result = img(u,v) * pattern(i+u, j+v)
    end
end
