function [total_forcex, total_forcey] = wallforce(xp,yp)
%% OUTPUTS
% xforce,yforce = resulting repelant force from walls.

%% INPUTS
% xp,yp = a column vector of the x and y coordinates for each particle at
% one point in time.


k = 0.1;


%assumes 0,0 is centre of the room
wallx1 = 100;
distancefromwallx1 = abs(wallx1 - xp);
wallx1force = -exp(-distancefromwallx1./k);

wallx2 = -100;
distancefromwallx2 = abs(wallx2 - xp);
wallx2force = exp(-distancefromwallx2./k);

wally1 = 100;
distancefromwally1 = abs(wally1 - yp);
wally1force = -exp(-distancefromwally1./k);

wally2 = -100;
distancefromwally2 = abs(wally2 - yp);
wally2force = -exp(-distancefromwally2./k);

total_forcex = wallx1force + wallx2force;
total_forcey = wally1force + wally2force;

