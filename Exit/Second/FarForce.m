function [xFarForce,yFarForce] = FarForce(xp,yp)

% FARFORCE - function that takes the x and y coordinates and returns an
% attractive force towards a mean position of distant particles

%[xFarForce,yFarForce]
%% OUTPUTS
% xFarForce,yFarForce = A normalised matrix of the attractive force towards
% the average position of distant particles in the x and y direction

%% INPUTS
% xp,yp = column vectors of x and y position at a timestep


nRows = size(xp,1);
nCol = size(xp,2);
xFarForce = zeros([nRows,nCol]);
yFarForce = zeros([nRows,nCol]);
outer_radius = 7.5;


for j = 1:nCol
    for i = 1:nRows
        xpos = xp(:,j);
        ypos = yp(:,j);
        nearx = xpos - xp(i,j);
        neary = ypos - yp(i,j);
        nearx(i) = 0;
        neary(i) = 0;
    
        
    
        mag = magnitudefinder(nearx,neary);
        index = mag <= outer_radius;
        number_of_particles = size(mag(mag>outer_radius),1);

        if number_of_particles == 0
            xFarForce(i,j) = 0;
            yFarForce(i,j) = 0;
        else
        
            nearx(index) = 0;
            average_positionx = sum(nearx);
            xFarForce(i,j) = sum(average_positionx)/number_of_particles;
    
            neary(index) = 0;
            average_positiony = sum(neary);
            yFarForce(i,j) = sum(average_positiony)/number_of_particles;
        end

        



    end
end
if norm(xFarForce) ~= 0
    xFarForce = xFarForce/norm(xFarForce);
end
if norm(yFarForce) ~= 0
    yFarForce = yFarForce/norm(yFarForce);
end
end
