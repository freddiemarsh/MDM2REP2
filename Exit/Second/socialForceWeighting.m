function [socialForceWeighting,optimal_alpha,x] = socialForceWeighting(filepath,tx,ty,desired_speed)
%% INPUTS
%filepath = filepath of outputted data from a simulation
% tx,ty (optional) = x and y coordinates of target destination for navigation
%
% desired_speed (optional) = desired walking speed

%% OUTPUTS
% socialForceWeighting = a normalised vector of the coefficients denoting
% the relative weighting of each force

[xp,yp,vx,vy,ax,ay] = filereader5(filepath);
a0 = [1,1,1,1,1];

if ~exist('tx','var')
    tx = NaN;
    ty = NaN;
    desired_speed = NaN;
    xforcenav = 0;
    yforcenav = 0;
else
    [xforcenav,yforcenav] = navigation(xp,yp,tx,ty,vx,vy,desired_speed);
end

[xforceprox,yforceprox] = nearest_person_force(xp,yp);
[xforcewall, yforcewall] = wallforceWithGap(xp,yp);
[xForceVelMatch,yForceVelMatch] = velocityMatching(xp,yp,vx,vy);
[xFarForce,yFarForce] = FarForce(xp,yp);


f = @(a,xforcewall,xforceprox,yforcewall,yforceprox,xForceVelMatch,yForceVelMatch,xFarForce,yFarForce,xforcenav,yforcenav) sum(sum(abs(a(1) .* xforcewall + a(2) .* xforceprox +a(3) * xForceVelMatch + a(4) * xFarForce + a(5) * xforcenav- ax)+abs(a(1) .* yforcewall + a(2) .* yforceprox + a(3) *yForceVelMatch + a(4) * yFarForce + a(5) * yforcenav - ay)));

fun = @(a)f(a,xforcewall,xforceprox,xforcenav,yforcewall,yforceprox,yforcenav,xFarForce,yFarForce,xForceVelMatch,yForceVelMatch);



optimal_alpha = fmincon(fun,a0,[],[],[],[],[0,0,0,0,0],[1,1,1,0,1]);


socialForceWeighting = optimal_alpha/norm(optimal_alpha);
x = fun(optimal_alpha);


end
