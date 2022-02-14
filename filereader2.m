
function [pos_matrix, vel_matrix, acc_matrix] = filereader2(filepath)

%A = readmatrix('/Users/freddiemarsh/Documents/ENGMATHS Y2/MDM2/Group REP 2/model/Output/simulation_output_empty_room.txt');

% A = readmatrix('/Users/freddiemarsh/Documents/ENGMATHS Y2/MDM2/Group REP 2/model/Output/simulation_output.txt');

A = readmatrix(filepath);

x_position_matrix = A(7:6:end,:);
y_position_matrix = A(8:6:end,:);

x_velocity_matrix = velocity_matrix(x_position_matrix);
y_velocity_matrix = velocity_matrix(y_position_matrix);

x_acceleration_matrix = acceleration_matrix(x_position_matrix);
y_acceleration_matrix = acceleration_matrix(y_position_matrix);





pos_matrix = concaconated_matrix(x_position_matrix,y_position_matrix);
vel_matrix = concaconated_matrix(x_velocity_matrix,y_velocity_matrix);
acc_matrix = concaconated_matrix(x_acceleration_matrix,y_acceleration_matrix);




