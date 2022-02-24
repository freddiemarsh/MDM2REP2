function [socialForceWeighting,optimal_alpha,x] = socialForceWeightingWithoutNav(filepath)
%% INPUTS
%filepath = filepath of outputted data from a simulation
% tx,ty (optional) = x and y coordinates of target destination for navigation
%
% desired_speed (optional) = desired walking speed

%% OUTPUTS
% socialForceWeighting = a normalised vector of the coefficients denoting
% the relative weighting of each force

[xp,yp,vx,vy,ax,ay] = filereader5(filepath);
a0 = [1,1];

ax = ax(:,3:end);
ay = ay(:,3:end);

[xforceprox,yforceprox] = nearest_person_force(xp,yp);
[xforcewall, yforcewall] = wallforce(xp,yp);


xforceprox = xforceprox(:,3:end);
yforceprox = yforceprox(:,3:end);

xforcewall = xforcewall(:,3:end);
yforcewall = yforcewall(:,3:end);


f = @(a,xforcewall,xforceprox,yforcewall,yforceprox) sum(sum(abs(a(1) .* xforcewall + a(2) .* xforceprox - ax)+abs(a(1) .* yforcewall + a(2) .* yforceprox - ay)));
fun = @(a)f(a,xforcewall,xforceprox,yforcewall,yforceprox);


options = optimset('MaxIter',200000,'MaxFunEvals',200000);
% optimal_alpha = fminsearch(fun,a0,options);

optimal_alpha = fmincon(fun,a0,[],[],[],[],[0,0],[1,1]);

socialForceWeighting = optimal_alpha/norm(optimal_alpha);
x = fun(optimal_alpha);


end
