function [fnetx,fnety] = fnet(xp,yp,tx,ty,vx,vy,desired_speed,a)

%% OUTPUTS
% fnetx,fnety = net social force on each particle in the x and y directions
% at a point in time.

%% INPUTS
% xp,yp = column vector of x and y coordinates of the particles at a point
% in time

% tx,ty = target desitnation coordinates

% vx,vy = column vector of x and y velocities of the particles at a point
% in time

% desired_speed = desired speed of a particle (just an average walking
% speed

% a = triple vector containing the weightings for the social forces

[xforcenav,yforcenav] = navigation(xp,yp,tx,ty,vx,vy,desired_speed);
[xforceprox,yforceprox] = nearest_person_force(xp,yp);
[xforcewall, yforcewall] = wallforce(xp,yp);


fnetx = a(1) .* xforcewall + a(2) .* xforceprox +a(3) .* xforcenav;

fnety = a(1) .* yforcewall + a(2) .* yforceprox +a(3) .* yforcenav;
end
