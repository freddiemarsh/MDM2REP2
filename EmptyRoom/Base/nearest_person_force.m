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

[xdistance,ydistance] = nearest_person_finder(xp,yp);


xforce = zeros(size(xdistance));
yforce = zeros(size(xdistance));

positive_xdis_index = find(xdistance>=0);
xforce(positive_xdis_index) = -exp((-(xdistance(positive_xdis_index)))./k);
negative_xdis_index = find(xdistance<0);
xforce(negative_xdis_index) = exp(((xdistance(negative_xdis_index)))./k);

positive_ydis_index = find(ydistance>=0);
yforce(positive_ydis_index) = -exp((-(ydistance(positive_ydis_index)))./k);
negative_ydis_index = find(ydistance<0);
yforce(negative_ydis_index) = exp(((ydistance(negative_ydis_index)))./k);



xforce = xforce./norm(xforce);
yforce = yforce./norm(yforce);
end



