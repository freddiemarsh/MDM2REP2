
filepath = '/Users/freddiemarsh/Documents/ENGMATHS Y2/MDM2/Group REP 2/Text Reader/Output Data/Empty Room (ER)/ER_test9.txt';
number = 75;
[xp,yp,vx,vy,ax,ay] = filereader5(filepath);
xarray = xp(:,number);
yarray = yp(:,number);


%test9 and 50 is a good graph





scatter(xarray,yarray); hold on;

[b,a] = socialForceWeightingWithoutNav(filepath);

[xforceprox,yforceprox] = nearest_person_force(xp,yp);
[xforcewall, yforcewall] = wallforce(xp,yp);
[xForceVelMatch,yForceVelMatch] = velocityMatching(xp,yp,vx,vy);
[xFarForce,yFarForce] = FarForce(xp,yp);

a =abs(a);

adjustedFWx = xforcewall * a(1);
adjustedFPx = xforceprox * a(2);
adjustedFVx = xForceVelMatch *a(3);
adjustedFFx = xFarForce *a(4);

adjustedFWy = yforcewall * a(1);
adjustedFPy = yforceprox * a(2);
adjustedFVy = yForceVelMatch *a(3);
adjustedFFy = yFarForce *a(4);


adjustedFWx = adjustedFWx(:,number);
adjustedFPx = adjustedFPx(:,number);
adjustedFVx = adjustedFVx(:,number);
adjustedFFx = adjustedFFx(:,number);

adjustedFWy = adjustedFWy(:,number);
adjustedFPy = adjustedFPy(:,number);
adjustedFVy = adjustedFVy(:,number);
adjustedFFy = adjustedFFy(:,number);





quiver(xarray,yarray,adjustedFWx,adjustedFWy,'r'); hold on;
quiver(xarray,yarray,adjustedFPx,adjustedFPy,'g'); hold on;
quiver(xarray,yarray,adjustedFVx,adjustedFVy,'b'); hold on;
quiver(xarray,yarray,adjustedFFx,adjustedFFy,'c'); hold on;

xlim([0,20]);
ylim([0,20]);

FX = a(1) .* xforcewall + a(2) .* xforceprox +a(3) * xForceVelMatch + a(4) * xFarForce;
FY = a(1) .* yforcewall + a(2) .* yforceprox +a(3) * yForceVelMatch + a(4) * yFarForce;
sum(sum(FX))
sum(sum(FY))
