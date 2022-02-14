function [xdistance,ydistance] = nearest_person_finderbackup(xpos,ypos)

%[xdistance,ydistance]
%% OUTPUTS
% xdistance,ydistance = column vectors of distance in x and y from nearest
% particle

%% INPUTS
% xpos,ypos = column vectors of x and y position at a timestep



nRows = size(xpos,1);
nCol = size(xpos,2);
xdistance = zeros([nRows,nCol]);
ydistance = zeros([nRows,nCol]);


for j = 1:nCol
    for i = 1:nRows
        hi = xpos(i)
        xpos = xpos
        nearx = xpos - xpos(i)
        neary = ypos - ypos(i);
        nearx(i) = 100000;
        neary(i) = 100000;
    
        
    
        mag = magnitudefinder(nearx,neary);
        [M,k] = min(mag);
        size
        xdistance(i) = nearx(k);
        ydistance(i) = neary(k);
    end
    
end

end