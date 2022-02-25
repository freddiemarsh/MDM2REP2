function [acceleration_matrix] = acceleration_matrix(position_matrix)
%ACCELERATION_MATRIX - function that returns accaleration froma set of
%position data


%INPUTS
%position_matrix = matrix of a single coordinate denotiting position for a
%column of particles with each row being a new timestep

%OUTPUTS
%acceleration_matrix = matrix of estimated acceleration of each partice at
%each time step

acceleration_matrix = zeros(size(position_matrix));
nColumns = size(position_matrix,2);
vel_matrix = velocity_matrix(position_matrix);
for k = 1:nColumns-2
    acceleration_matrix(:,k+2) = vel_matrix(:,k+1) - vel_matrix(:,k);
end
