function [socialForceWeighting,optimal_alpha,x] = socialForceWeightingWithoutNav(filepath)
%SOCIALFORCEWEIGHTINGWITHOUTNAV - function that returns the weightings of a
%series of forces to best match the movement of particles interacting with
%eachother and a space

%% INPUTS
%filepath = filepath of outputted data from a simulation
% tx,ty (optional) = x and y coordinates of target destination for navigation
%
% desired_speed (optional) = desired walking speed

%% OUTPUTS
% socialForceWeighting = a normalised vector of the coefficients denoting
% the relative weighting of each force
% optimal_alpha = vector of the coefficients denoting
% the relative weighting of each force
% x = the final value of the parameter being minimised
%%
[xp,yp,vx,vy,ax,ay] = filereader5(filepath);
a0 = [1,1,1,1];


[xforceprox,yforceprox] = nearest_person_force(xp,yp);
[xforcewall, yforcewall] = wallforce(xp,yp);
[xForceVelMatch,yForceVelMatch] = velocityMatching(xp,yp,vx,vy);
[xFarForce,yFarForce] = FarForce(xp,yp);



xforceprox = xforceprox(:,3:end);
yforceprox = yforceprox(:,3:end);

xforcewall = xforcewall(:,3:end);
yforcewall = yforcewall(:,3:end);

xForceVelMatch = xForceVelMatch(:,3:end);
yForceVelMatch = yForceVelMatch(:,3:end);

xFarForce = xFarForce(:,3:end);
yFarForce = yFarForce(:,3:end);



f = @(a,xforcewall,xforceprox,yforcewall,yforceprox,xForceVelMatch,yForceVelMatch,xFarForce,yFarForce) sum(sum(abs(a(1) .* xforcewall + a(2) .* xforceprox +a(3) * xForceVelMatch + a(4) * xFarForce - ax(:,3:end))+abs(a(1) .* yforcewall + a(2) .* yforceprox + a(3) *yForceVelMatch + a(4) * yFarForce - ay(:,3:end))));
fun = @(a)f(a,xforcewall,xforceprox,yforcewall,yforceprox,xForceVelMatch,yForceVelMatch,xFarForce,yFarForce);


options = optimset('MaxIter',200000,'MaxFunEvals',200000);
% optimal_alpha = fminsearch(fun,a0,options);




optimal_alpha = fmincon(fun,a0,[],[],[],[],[0,0,0,0],[1,1,1,1]);





socialForceWeighting = optimal_alpha/norm(optimal_alpha);
x = fun(optimal_alpha);


end
