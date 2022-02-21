function [socialForceWeighting,optimal_alpha] = socialForceWeightingWithoutNav(filepath)
%% INPUTS
%filepath = filepath of outputted data from a simulation
% tx,ty (optional) = x and y coordinates of target destination for navigation
%
% desired_speed (optional) = desired walking speed

%% OUTPUTS
% socialForceWeighting = a normalised vector of the coefficients denoting
% the relative weighting of each force

[xp,yp,vx,vy,ax,ay] = filereader5(filepath);
a0 = [1,1,1,1];


[xforceprox,yforceprox] = nearest_person_force(xp,yp);
[xforcewall, yforcewall] = wallforce(xp,yp);
[xForceVelMatch,yForceVelMatch] = velocityMatching(xp,yp,vx,vy);
[xFarForce,yFarForce] = FarForce(xp,yp);

f = @(a,xforcewall,xforceprox,yforcewall,yforceprox,xForceVelMatch,yForceVelMatch,xFarForce,yFarForce) sum(sum(abs(a(1) .* xforcewall + a(2) .* xforceprox +a(3) * xForceVelMatch + a(4) * xFarForce - ax)+abs(a(1) .* yforcewall + a(2) .* yforceprox + a(3) *yForceVelMatch + a(4) * yFarForce - ay)));
fun = @(a)f(a,xforcewall,xforceprox,yforcewall,yforceprox,xForceVelMatch,yForceVelMatch,xFarForce,yFarForce);


options = optimset('MaxIter',200000,'MaxFunEvals',200000);
% optimal_alpha = fminsearch(fun,a0,options);




optimal_alpha = fmincon(fun,a0,[],[],[1,1,1,1],1,[0,0,0,0],[1,1,1,1]);





socialForceWeighting = optimal_alpha/norm(optimal_alpha);



end