filepath = '/Users/freddiemarsh/Documents/ENGMATHS Y2/MDM2/Group REP 2/Text Reader/Output Data 2/One Exit (OE)/OE_test5.txt';
number = 1;
[xp,yp,vx,vy,ax,ay] = filereader5(filepath);
xarray = xp(:,number);
yarray = yp(:,number);


%test9 and 50 is a good graph


tx = 3;
ty = 10;
desired_speed = 0.02;


scatter(xarray,yarray,100,'k','filled','DisplayName','Particles'); hold on;
scatter(tx,ty,750,'red','filled','DisplayName','Particles'); hold on;

[b,a] = socialForceWeighting(filepath,tx,ty,desired_speed);

[xforceprox,yforceprox] = nearest_person_force(xp,yp);
[xforcewall, yforcewall] = wallforceWithGap(xp,yp);
[xforce,yforce] = navigation(xp,yp,tx,ty,vx,vy,desired_speed);



adjustedFWx = xforcewall * a(1);
adjustedFPx = xforceprox * a(2);

adjustedFNx = xforce *a(3);



adjustedFWy = yforcewall * a(1);
adjustedFPy = yforceprox * a(2);

adjustedFNy = yforce *a(3);


adjustedFWx = adjustedFWx(:,number);
adjustedFPx = adjustedFPx(:,number);

adjustedFNx = adjustedFNx(:,number);

adjustedFWy = adjustedFWy(:,number);
adjustedFPy = adjustedFPy(:,number);

adjustedFNy = adjustedFNy(:,number);


scalar = 1;

quiver(xarray,yarray,scalar*adjustedFWx,scalar*adjustedFWy,0,'r','LineWidth',3,'DisplayName','Wall Force'); hold on;
quiver(xarray,yarray,scalar*adjustedFPx,scalar*adjustedFPy,0,'g','LineWidth',3,'DisplayName','Proximity Force'); hold on;
quiver(xarray,yarray,scalar*adjustedFNx,scalar*adjustedFNy,0,'y','LineWidth',3,'DisplayName','Navigational Force'); hold on;
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
