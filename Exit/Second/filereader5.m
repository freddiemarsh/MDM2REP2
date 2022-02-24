function [x_position_matrix, y_position_matrix, x_velocity_matrix, y_velocity_matrix, x_acceleration_matrix, y_acceleration_matrix] = filereader5(filepath)



%A = readmatrix('/Users/freddiemarsh/Documents/ENGMATHS Y2/MDM2/Group REP 2/model/Output/simulation_output_empty_room.txt');

A = readmatrix(filepath);


%% Cleans data to just the x and y positions then calculates the velocity and acceleration

x_position_matrix = A(6:6:end,:)';
y_position_matrix = A(7:6:end,:)';
x_position_matrix = x_position_matrix(:,1:954);
y_position_matrix = y_position_matrix(:,1:954);

x_velocity_matrix = velocity_matrix(x_position_matrix);
y_velocity_matrix = velocity_matrix(y_position_matrix);

x_acceleration_matrix = acceleration_matrix(x_position_matrix);
y_acceleration_matrix = acceleration_matrix(y_position_matrix);





