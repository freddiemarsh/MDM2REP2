function [xdistance,ydistance] = nearest_person_finder(xp,yp)

%[xdistance,ydistance]
%% OUTPUTS
% xdistance,ydistance = column vectors of distance in x and y from nearest
% particle

%% INPUTS
% xpos,ypos = column vectors of x and y position at a timestep



nRows = size(xp,1);
nCol = size(xp,2);
xdistance = zeros([nRows,nCol]);
ydistance = zeros([nRows,nCol]);


for j = 1:nCol
    for i = 1:nRows
        xpos = xp(:,j);
        ypos = yp(:,j);
        nearx = xpos - xp(i,j);
        neary = ypos - yp(i,j);
        nearx(i) = 100000;
        neary(i) = 100000;
    
        
    
        mag = magnitudefinder(nearx,neary);
        [M,k] = min(mag);
        xdistance(i,j) = nearx(k);
        ydistance(i,j) = neary(k);
    end
    
end
end