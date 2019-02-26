originMatrix = [
    0 0 0 0 0 0 0
    0 0 1 1 0 0 0
    0 0 0 1 0 0 0 
    0 0 0 1 1 0 0 
    0 0 1 1 1 1 0
    0 0 1 1 1 0 0 
    0 1 0 1 0 1 0
    0 0 0 0 0 0 0];
% -----------------QUESTION a-----------------
display('-----------------QUESTION a-----------------');
unit1 = [1 1 1];
origin1 = [1; 1];
% padding: 输入原始矩阵，输入扩充后的矩阵尺寸，输入左上角的位置
paddedMatrix1 = padding(originMatrix, unit1, origin1);
% dilation
dilationMat1 = dilation(paddedMatrix1, unit1, origin1);
display(dilationMat1)

% -----------------QUESTION b-----------------
display('-----------------QUESTION b-----------------');
% dilation
erosionMat1 = erosion(paddedMatrix1, unit1, origin1);
display(erosionMat1)

% -----------------QUESTION c-----------------
display('-----------------QUESTION c-----------------');
unit2 = [1 1; 0 1];
origin2 = [1; 2];
% padding: 输入原始矩阵，输入扩充后的矩阵尺寸，输入左上角的位置
paddedMatrix2 = padding(originMatrix, unit2, origin2);
% dilation
dilationMat2 = dilation(paddedMatrix2, unit2, origin2);
display(dilationMat2)

% -----------------QUESTION d-----------------
display('-----------------QUESTION d-----------------');
% erosion
erosionMat2 = erosion(paddedMatrix2, unit2, origin2);
display(erosionMat2)

% -----------------QUESTION e-----------------
display('-----------------QUESTION e-----------------');
openMat1 = dilation(padding(erosion(paddedMatrix1, unit1, origin1), unit1, origin1), unit1, origin1);
display(openMat1);
openMat2 = dilation(padding(erosion(paddedMatrix2, unit2, origin2), unit2, origin2), unit2, origin2);
display(openMat2);
% -----------------QUESTION f-----------------
display('-----------------QUESTION f-----------------');
closeMat1 = erosion(padding(dilation(paddedMatrix1, unit1, origin1), unit1, origin1), unit1, origin1);
display(closeMat1);
closeMat2 = erosion(padding(dilation(paddedMatrix2, unit2, origin2), unit2, origin2), unit2, origin2);
display(closeMat2);
