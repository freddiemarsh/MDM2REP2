function [xforce,yforce] = nearest_person_force(xp,yp)
%% OUTPUTS
% xforce,yforce = resulting repelant force from nearest person.

%% INPUTS
% xp,yp = a column vector of the x and y coordinates for each particle at
% one point in time.

%% NOTES
%if theres two particles of equal distance from another, it picks a random
%one. This is important if the particles are in opposite directions

k = 1;
%scales how strong the repulsive force becomes depending on distance
r = 0.5;


[xdistance,ydistance] = nearest_person_finder(xp,yp);

xforce = exp(-(xdistance-r)./k)./norm(exp(-(xdistance-r)./k));
yforce = exp(-(ydistance-r)./k)./norm(exp(-(ydistance-r)./k));

end


