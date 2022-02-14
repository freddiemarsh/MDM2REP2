function [J] = Q2c(fvec, xvec,h)
%Q2C Function to caluculate jacobain matrix given a column vector of functions and
%a column vector of coordinates

%Inputs
%           fvec = a column vector of functions given in the form 
%           fvec = (x) [f1(x(1)...x(n));.....;fn(x(1)...x(n)]
%               where x is the vectore of coordinate variables
%           xvec = a column vector of values for each coordinate
%           h = finite difference offset
%Outputs
%             J = numerical approximation to the Jacobian matrix
%               = nxn matrix


%Creating an empty nxn Jacobain matix J
n = length(xvec);
J = zeros(n,n);


for i = 1:n
    
    for j = 1:n
        %Iterating through each element in the Jacobian

        %Adding or subtractin the small incriment h to the jth element in xvec
        zerovec = zeros(n,1);
        zerovec(j) = h;

        xvechplus = [xvec + zerovec]';
        xvechminus = [xvec - zerovec]';

        %Using these updated xvec lists to apply central difference
        %formula.
        centralDiff = (fvec(xvechplus)-fvec(xvechminus))./(2*h);
        %Taking the value of the ith function
        centralDiffi = centralDiff(i);
        %adding this to the Jacobian
        J(i,j) = centralDiffi;


    end
end



end