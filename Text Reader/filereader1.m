
function [position_matrix, velocity_matrix, acceleration_matrix] = filereader1(filepath)

%A = readmatrix('/Users/freddiemarsh/Documents/ENGMATHS Y2/MDM2/Group REP 2/model/Output/simulation_output_empty_room.txt');

% A = readmatrix('/Users/freddiemarsh/Documents/ENGMATHS Y2/MDM2/Group REP 2/model/Output/simulation_output.txt');

A = readmatrix(filepath);

x_coords = A(7:6:end,:);
y_coords = A(8:6:end,:);

nColumns = size(x_coords,2);
AB = [x_coords,y_coords]'; 
position_matrix = reshape(AB(:),nColumns,[])';

velocity_matrix = zeros(size(position_matrix));

for k = 1:nColumns-1
    velocity_matrix(:,k) = position_matrix(:,k+1) - position_matrix(:,k);
end

acceleration_matrix = zeros(size(position_matrix));

for k = 1:nColumns-2
    acceleration_matrix(:,k) = velocity_matrix(:,k+1) - velocity_matrix(:,k);
end


end


