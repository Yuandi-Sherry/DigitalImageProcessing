function InverseFunction = getInverseFunction(originalFunction)
InverseFunction = zeros(256,1);
count = 0;
for i = 1:256
    if InverseFunction(originalFunction(i,1), 1) == 0
        InverseFunction(originalFunction(i,1), 1) = i;
    end
end
temp = 0
for i = 1:256
    if InverseFunction(i, 1) ~= 0
        temp = InverseFunction(i, 1);
    else
        InverseFunction(i, 1) = temp
    end 
end