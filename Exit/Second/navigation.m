function [xforce,yforce] = navigation(xp,yp,tx,ty,vx,vy,desired_speed)
%NAVIGATION - function to calculate the navigational dampening force
%guiding each particle towards a target
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
nRows = size(xp,1);
nCol = size(xp,2);
xforce = zeros([nRows,nCol]);
yforce = zeros([nRows,nCol]);

for j = 1:nCol
    for i = 1:nRows
        ex = tx - xp(i,j);
        ey = ty - yp(i,j);
        if ex ~= 0
            unitex = ex/norm(ex);
            xforce(i,j) = (desired_speed.*unitex - vx(i,j));
        else 
            xforce(i,j) = 0;
        end
        if ey ~= 0 
            unitey = ey/norm(ey);
            yforce(i,j) = (desired_speed.*unitey - vy(i,j));
        else
            yforce(i,j) = 0;
        end
        
    end
end

xforce = xforce./norm(xforce);
yforce = yforce./norm(yforce);








