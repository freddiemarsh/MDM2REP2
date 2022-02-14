function [argument] = argument(xmatrix,ymatrix)

nRows = size(xmatrix,1);
nColumns = size(xmatrix,2);
argument = zeros(size(xmatrix));

for k = 1:nRows
    for j = 1:nColumns
        x = xmatrix(k:j);
        y = ymatrix(k:j);
        argument(k:j) = atan2(y,x);



    end
end