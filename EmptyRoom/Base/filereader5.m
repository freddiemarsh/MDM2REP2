function [x_position_matrix, y_position_matrix, x_velocity_matrix, y_velocity_matrix, x_acceleration_matrix, y_acceleration_matrix] = filereader5(filepath)
% FILEREADER5 - function to read a .txt file of the output data from a
% simulation and returns the position, velocity and acceleration at each
% timestep.

%% INPUTS
% filepath = filepath for .txt output file

%% OUTPUTS
% x_position_matrix, y_position_matrix = x and y position matrices
% y_position_matrix, x_velocity_matrix = x and y velocity matrices
% x_acceleration_matrix, y_acceleration_matrix = x and y acceleration
% matrices


A = readmatrix(filepath);


%% Cleans data to just the x and y positions then calculates the velocity and acceleration

x_position_matrix = A(6:6:end,:)';
y_position_matrix = A(7:6:end,:)';
x_position_matrix = x_position_matrix(:,1:100);
y_position_matrix = y_position_matrix(:,1:100);

x_velocity_matrix = velocity_matrix(x_position_matrix);
y_velocity_matrix = velocity_matrix(y_position_matrix);

x_acceleration_matrix = acceleration_matrix(x_position_matrix);
y_acceleration_matrix = acceleration_matrix(y_position_matrix);





