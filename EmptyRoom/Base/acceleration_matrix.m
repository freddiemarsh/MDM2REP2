function [acceleration_matrix] = acceleration_matrix(position_matrix)

acceleration_matrix = zeros(size(position_matrix));
nColumns = size(position_matrix,2);
vel_matrix = velocity_matrix(position_matrix);
for k = 1:nColumns-2
    acceleration_matrix(:,k+2) = vel_matrix(:,k+1) - vel_matrix(:,k);
end
