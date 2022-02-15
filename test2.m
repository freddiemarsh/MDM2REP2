[xp,yp,vx,vy,ax,ay] = filereader5('/Users/freddiemarsh/Documents/ENGMATHS Y2/MDM2/Group REP 2/model/Output/simulation_output_empty_room.txt');
tx = 50;
ty =50;
desired_speed = 0.149;
nRows = size(xp,1);
nCol = size(xp,2);
unitex = zeros([nRows,nCol]);



for j = 1:nCol
    for i = 1:nRows
        ex = tx - xp(i,j);
        ey = ty - yp(i,j);
        unitex(i,j) = ex/norm(ex);
        unitey(i,j) = ey/norm(ey);
    end
end

xforce = (desired_speed.*unitex - vx);
yforce = (desired_speed.*unitey - vy);




