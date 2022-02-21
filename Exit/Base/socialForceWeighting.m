function [socialForceWeighting,optimal_alpha] = socialForceWeighting(filepath,tx,ty,desired_speed)
%% INPUTS
%filepath = filepath of outputted data from a simulation
% tx,ty (optional) = x and y coordinates of target destination for navigation
%
% desired_speed (optional) = desired walking speed

%% OUTPUTS
% socialForceWeighting = a normalised vector of the coefficients denoting
% the relative weighting of each force

[xp,yp,vx,vy,ax,ay] = filereader5(filepath);
a0 = [1,1,1];
median(median(xp))

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


f = @(a,xforcewall,xforceprox,xforcenav,yforcewall,yforceprox,yforcenav) sum(sum(abs(a(1) .* xforcewall + a(2) .* xforceprox +a(3) .* xforcenav - ax)+abs(a(1) .* yforcewall + a(2) .* yforceprox +a(3) .* yforcenav - ay)));
fun = @(a)f(a,xforcewall,xforceprox,xforcenav,yforcewall,yforceprox,yforcenav);
optimal_alpha = fminsearch(fun,a0);



socialForceWeighting = optimal_alpha/norm(optimal_alpha);



end
