function [magnitude] = magnitudefinder(xmatrix,ymatrix)
%MAGNITUDEFINDER = function that finds the magnitude of x coordinate and a
%y coordinate

%% INPUTS
% xmatrix,ymatrix = x and y matrices that have corresponding entries
%% OUTPUTS
% magnitude = the magnitude of the two inout matrices

nColumns = size(xmatrix,2);
magnitude = zeros(size(xmatrix));
for k = 1:nColumns
    magnitude(:,k) = sqrt( xmatrix(:,k).^2 + ymatrix(:,k).^2  );
end
end
