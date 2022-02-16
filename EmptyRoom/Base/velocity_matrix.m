function [velocity_matrix] = velocity_matrix(position_matrix)

velocity_matrix = zeros(size(position_matrix));
nColumns = size(position_matrix,2);
for k = 1:nColumns-1
    velocity_matrix(:,k+1) = position_matrix(:,k+1) - position_matrix(:,k);
end
