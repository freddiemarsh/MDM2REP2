function [concaconated_matrix] = concaconated_matrix(xmatrix,ymatrix)

nColumns = size(xmatrix,2);
AB = [xmatrix,ymatrix]'; 
concaconated_matrix = reshape(AB(:),nColumns,[])';