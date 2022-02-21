function [xNearForce,yNearForce] = velocityMatching(xp,yp,vx,vy)
%% OUTPUTS
% xNearForce,yNearForce = The normalised forces in the x and y direction resulting
% from a velocity matching attractive force.

%% INPUTS
% xp,yp = column vectors of x and y position at a timestep
% vx,vy = column vectors of x and y velocities at each timestep



nRows = size(xp,1);
nCol = size(xp,2);
xNearForce = zeros([nRows,nCol]);
yNearForce = zeros([nRows,nCol]);
inner_radius = 2;


for j = 1:nCol
    for i = 1:nRows
        xpos = xp(:,j);
        ypos = yp(:,j);
        nearx = xpos - xp(i,j);
        neary = ypos - yp(i,j);


        xvol = vx(:,j);
        yvol = vy(:,j);
        relVolx = xvol - vx(i,j);
        relVoly = yvol - vy(i,j);
    
        
    
        mag = magnitudefinder(nearx,neary);
        index = mag >= inner_radius;
        number_of_particles = size(mag(mag<inner_radius),1) - 1;

        if number_of_particles == 0
            xNearForce(i,j) = 0;
            yNearForce(i,j) = 0;
        else
        
            relVolx(index) = 0;
            average_velocityx = sum(relVolx);
            xNearForce(i,j) = sum(average_velocityx)/number_of_particles;
    
            relVoly(index) = 0;
            average_velocityy = sum(relVoly);
            yNearForce(i,j) = sum(average_velocityy)/number_of_particles;

        end
        



    end
end

if norm(xNearForce) ~= 0
    xNearForce = xNearForce/norm(xNearForce);
end
if norm(yNearForce) ~= 0
    yNearForce = yNearForce/norm(yNearForce);



end
end