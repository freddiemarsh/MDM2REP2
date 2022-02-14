function [xforce,yforce] = navigation(xp,yp,tx,ty,vx,vy,desired_speed)
%% OUTPUTS
% xforce, yforce is the calculated attractive force produced by the target
% destination

%% INPUTS
% xp,yp = column vector of x and y coordinates of the particles at a point
% in time

% tx,ty = target desitnation coordinates

% vx,vy = column vector of x and y velocities of the particles at a point
% in time

% desired_speed = desired speed of a particle (just an average walking
% speed

%% Force in x

ex = tx - xp;
xforce = (desired_speed.*ex - vx);

% Broken

%% Force in y

ey = ty - yp;
yforce = (desired_speed.*ey - vy);












