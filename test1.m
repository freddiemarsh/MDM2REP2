[xp,yp,vx,vy,ax,ay] = filereader5('/Users/freddiemarsh/Documents/ENGMATHS Y2/MDM2/Group REP 2/model/Output/simulation_output_empty_room.txt');
tx = 10;
ty = 10;
desired_speed = 4;
fnetxmatrix = zeros(size(xp));
fnetymatrix = zeros(size(yp));
a0 = [1,1,1];

[xforcenav,yforcenav] = navigation(xp,yp,tx,ty,vx,vy,desired_speed);
[xforceprox,yforceprox] = nearest_person_force(xp,yp);
[xforcewall, yforcewall] = wallforce(xp,yp);




f = @(a,xforcewall,xforceprox,xforcenav) sum(sum(abs(a(1) .* xforcewall + a(2) .* xforceprox +a(3) .* xforcenav - ax)+abs(a(1) .* yforcewall + a(2) .* yforceprox +a(3) .* yforcenav - ay)));


fuckthis = f(a0,xforcewall,xforceprox,xforcenav);

fun = @(a) f(a,xforcewall,xforceprox,xforcenav);
optimal_alpha = fminsearch(fun,a0);
fcheck = @(alpha,xforcewall,xforceprox,xforcenav) alpha(1) .* xforcewall + alpha(2) .* xforceprox +alpha(3) .* xforcenav - ax;
hello = fcheck(optimal_alpha,xforcewall,xforceprox,xforcenav);
% check nearest person finder AND force, make sure it works for vector and matrix. 