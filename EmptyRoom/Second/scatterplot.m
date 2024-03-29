
filepath = '/Users/freddiemarsh/Documents/ENGMATHS Y2/MDM2/Group REP 2/Text Reader/Output Data 2/Empty Room (ER)/ER_test10.txt';
number = 10;
[xp,yp,vx,vy,ax,ay] = filereader5(filepath);
xarray = xp(:,number);
yarray = yp(:,number);


%test9 and 50 is a good graph





scatter(xarray,yarray,100,'k','filled','DisplayName','Particles'); hold on;

[b,a] = socialForceWeightingWithoutNav(filepath);

[xforceprox,yforceprox] = nearest_person_force(xp,yp);
[xforcewall, yforcewall] = wallforce(xp,yp);
[xForceVelMatch,yForceVelMatch] = velocityMatching(xp,yp,vx,vy);
[xFarForce,yFarForce] = FarForce(xp,yp);

%a2 = [0.4269,0.2010,0.0207,0.0776];

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





quiver(xarray,yarray,15000*adjustedFWx,15000*adjustedFWy,0,'r','LineWidth',3,'DisplayName','Wall Force'); hold on;
quiver(xarray,yarray,25000*adjustedFPx,25000*adjustedFPy,0,'g','LineWidth',3,'DisplayName','Proximity Force'); hold on;
quiver(xarray,yarray,15000*adjustedFVx,15000*adjustedFVy,0,'b','LineWidth',3,'DisplayName','Velocity Matching Force'); hold on;
quiver(xarray,yarray,15000*adjustedFFx,15000*adjustedFFy,0,'m','LineWidth',3,'DisplayName','Long Range Attractive Force'); hold on;
xline(0,'LineWidth',3);
xline(20,'LineWidth',3);
yline(0,'LineWidth',3);
yline(20,'LineWidth',3)

axis equal;




legend;
title('Force diagram of particles');
xlabel('X position withing the empty room');
ylabel('Y position withing the empty room');
xlim([0,20]);
ylim([0,20]);
set(gca,'FontSize',20)

FX = a(1) .* xforcewall + a(2) .* xforceprox +a(3) * xForceVelMatch + a(4) * xFarForce;
FY = a(1) .* yforcewall + a(2) .* yforceprox +a(3) * yForceVelMatch + a(4) * yFarForce;
sum(sum(FX));
sum(sum(FY));
