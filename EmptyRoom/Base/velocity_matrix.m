function [velocity_matrix] = velocity_matrix(position_matrix)
%VELOCITY_MATRIX - function that returns accaleration froma set of
%position data


%INPUTS
%position_matrix = matrix of a single coordinate denotiting position for a
%column of particles with each row being a new timestep

%OUTPUTS
%velocity_matrix = matrix of estimated velocity of each partice at
%each time step
velocity_matrix = zeros(size(position_matrix));
nColumns = size(position_matrix,2);
for k = 1:nColumns-1
    velocity_matrix(:,k+1) = position_matrix(:,k+1) - position_matrix(:,k);
end
