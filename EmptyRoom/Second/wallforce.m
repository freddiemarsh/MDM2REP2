function [total_forcex, total_forcey] = wallforce(xp,yp)
%WALLFORCE - function that calculates the force generated from a particles
%proximity to a 'wall'


%% OUTPUTS
% total_forcex,total_forcey = resulting repelant forces from walls.

%% INPUTS
% xp,yp = a column vector of the x and y coordinates for each particle at
% one point in time.

k = 1;
r = 0.5;

%assumes 10,10 is centre of the room
wallx1 = 20;
distancefromwallx1 = abs(wallx1 - xp-r);
wallx1force = -exp(-distancefromwallx1./k);

wallx2 = 0;
distancefromwallx2 = abs(wallx2 - xp-r);
wallx2force = exp(-distancefromwallx2./k);

wally1 = 20;
distancefromwally1 = abs(wally1 - yp-r);
wally1force = -exp(-distancefromwally1./k);

wally2 = 0;
distancefromwally2 = abs(wally2 - yp-r);
wally2force = exp(-distancefromwally2./k);

total_forcex = (wallx1force + wallx2force)./norm(wallx1force + wallx2force);
total_forcey = (wally1force + wally2force)./norm(wally1force + wally2force);

