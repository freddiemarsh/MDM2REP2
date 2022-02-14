% [xp,yp,vx,vy,ax,ay] = filereader4;
%testing on nearest person finder - now in nearest person finder file :)

xp = [1;2;3];
yp = [1;4;3];

nRows = size(xp,1);
nCol = size(xp,2);
xdistance = zeros([nRows,nCol]);
ydistance = zeros([nRows,nCol]);


for j = 1:nCol
    for i = 1:nRows
        hi = xp(i,j);
        xpos = xp(:,j);
        ypos = yp(:,j);
        nearx = xpos - xp(i,j);
        neary = yp - yp(i,j);
        nearx(i) = 100000;
        neary(i) = 100000;
    
        
    
        mag = magnitudefinder(nearx,neary);
        [M,k] = min(mag);
        xdistance(i,j) = nearx(k);
        ydistance(i,j) = neary(k);
    end
    
end
xdistance
ydistance
