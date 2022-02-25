function [total_forcex, total_forcey] = wallforceWithGap(xp,yp)
%WALLFORCE - function that calculates the force generated from a particles
%proximity to a 'wall'


%% OUTPUTS
% total_forcex,total_forcey = resulting repelant forces from walls.

%% INPUTS
% xp,yp = a column vector of the x and y coordinates for each particle at
% one point in time.

%%
%MODIFIED TO INCLUDE EXIT PARAMETERS


k = 1;
r = 0.5;
nRows = size(xp,1);
nCol = size(xp,2);
total_forcex = zeros([nRows,nCol]);
total_forcey = zeros([nRows,nCol]);
%assumes 10,10 is centre of the room

for j = 1:nCol
    for i = 1:nRows



            wallx1 = 20;
            distancefromwallx1 = abs(wallx1 - xp(i,j))-r;
            wallx1force = -exp(-distancefromwallx1./k);
            
            wallx2 = 0;
            distancefromwallx2 = abs(wallx2 - xp(i,j))-r;
            wallx2force = exp(-distancefromwallx2./k);
            
            wally1 = 20;
            distancefromwally1 = abs(wally1 - yp(i,j))-r;
            if distancefromwallx1 > 9 & distancefromwallx2 > 9
                wally1force = 0;
            else
                wally1force = -exp(-distancefromwally1./k)-r;
            end
            
            wally2 = 0;
            distancefromwally2 = abs(wally2 - yp(i,j));
            wally2force = exp(-distancefromwally2./k)-r;
            

            total_forcex(i,j) = (wallx1force + wallx2force);
            total_forcey(i,j) = (wally1force + wally2force);

    end
end

total_forcex = total_forcex./norm(total_forcex);
total_forcey = (total_forcey)./norm(total_forcey);

end