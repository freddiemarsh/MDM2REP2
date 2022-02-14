function [magnitude] = magnitudefinder(xmatrix,ymatrix)

nColumns = size(xmatrix,2);
magnitude = zeros(size(xmatrix));
for k = 1:nColumns
    magnitude(:,k) = sqrt( xmatrix(:,k).^2 + ymatrix(:,k).^2  );
end
end
