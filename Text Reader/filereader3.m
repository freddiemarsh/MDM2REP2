
function [pos_matrix, vel_matrix, acc_matrix] = filereader3()

% [pos_matrix, vel_matrix, acc_matrix]
A = readmatrix('/Users/freddiemarsh/Documents/ENGMATHS Y2/MDM2/Group REP 2/model/Output/simulation_output_empty_room.txt');



%A = readmatrix(filepath);
%Reads file and converts to matrix, for some reason doesnt include first
%line of the csv, maybe because its not of the correct length

%% Cleans data to just the x and y positions then calculates the velocity and acceleration

x_position_matrix = A(6:6:end,:);
y_position_matrix = A(7:6:end,:);

x_velocity_matrix = velocity_matrix(x_position_matrix);
y_velocity_matrix = velocity_matrix(y_position_matrix);

x_acceleration_matrix = acceleration_matrix(x_position_matrix);
y_acceleration_matrix = acceleration_matrix(y_position_matrix);

%% Same as above but in radians (redundant right now but leaving it in the
% 
% pos_rad_mag = magnitude(x_position_matrix,y_position_matrix);
% pos_rad_arg = argument(x_position_matrix,y_position_matrix);
% 
% vel_rad_mag = magnitude(x_velocity_matrix,y_velocity_matrix);
% vel_rad_arg = argument(x_velocity_matrix,y_velocity_matrix);
% 
% acc_rad_mag = magnitude(x_acceleration_matrix,y_acceleration_matrix);
% acc_rad_arg = argument(x_acceleration_matrix,y_acceleration_matrix);




pos_matrix = concaconated_matrix(x_position_matrix,y_position_matrix);
vel_matrix = concaconated_matrix(x_velocity_matrix,y_velocity_matrix);
acc_matrix = concaconated_matrix(x_acceleration_matrix,y_acceleration_matrix);



%% Test to see if data is correct, should plot a smooth funciton
%TO DO: Check velocity and acceleration


yarray = zeros(1,size(x_position_matrix,2));

for i = 1
    for j = 1:size(x_position_matrix,2)
        yarray(j) = x_position_matrix(i,j);
    end
    test2 = yarray;
    x_position_matrix(1,:);
    plot(yarray); hold on;
end

plot([8.61445626944089,7.3975174446687495,10.285072043770628,10.994264973843354,12.716365989212774,15.293703105393964,16.282936778657735,7.194793632350966,16.712263656294144,18.601760140628336,14.49801107961505,10.696415538893971,10.683906248418324,17.416941662636006,18.815505054544385,7.3138329682265875,12.61345399508622,10.9142142738502,15.497960800600575,10.69208949658036],'--g')
end