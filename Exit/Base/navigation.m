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
nRows = size(xp,1);
nCol = size(xp,2);
unitex = zeros([nRows,nCol]);
unitey = zeros([nRows,nCol]);

for j = 1:nCol
    for i = 1:nRows
        ex = tx - xp(i,j);
        ey = ty - yp(i,j);
        unitex(i,j) = ex/norm(ex);
        unitey(i,j) = ey/norm(ey);
    end
end

xforce = (desired_speed.*unitex - vx)./norm((desired_speed.*unitex - vx));
yforce = (desired_speed.*unitey - vy)./norm((desired_speed.*unitey - vy));











