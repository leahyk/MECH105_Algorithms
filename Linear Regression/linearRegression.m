function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
% This function is designed to compute the linear regression, line of best 
% fit, for a data set.
%
% INPUTS
%           x: x-values for our data set
%           y: y-values for our data set
%
% OUTPUTS
%           fX: x-values with outliers removed
%           fY: y-values with outliers removed
%           slope: slope from the linear regression y=mx+b
%           intercept: intercept from the linear regression y=mx+b
%           Rsquared: R^2, a.k.a. coefficient of determination

% error checking
if length(x) ~= length(y)
    error('vector dimentions need to match')
end

% finding outliers
n = length(x);

[fY, sortOrder] = sort(y);
fX = x(sortOrder);

Q1 = floor((n + 1)/4);
Q3 = floor((3*n + 3)/4);
IQR = Q3 - Q1;

i = 0;
index = 1;
while i ~= n
    i = i + 1;
    if fY(i) < fY(Q3) + 1.5*IQR && fY(i) > fY(Q1) - 1.5*IQR 
        newfY(index)=fY(i);
        newfX(index)=fX(i);
        index=index+1;
    end
end

fY = newfY;
fX = newfX;

% finding line of best fit
n = length(fX);
sum_y = sum(fY);
sum_x = sum(fX);
sum_xy = sum(fX.*fY);
sum_xSquared = sum(fX.^2);
meanX = mean(fX);
meanY = mean(fY);

slope = (n*sum_xy - sum_x*sum_y)/(n*sum_xSquared - sum_x.^2);
intercept = meanY - slope*meanX;

% finding R^2
St = 0;
for i = 1:n
    St_i = (fY(i) - meanY).^2;
    St = St + St_i;
end

Sr = 0;
for i = 1:n
    Sr_i = (fY(i) - (slope*fX(i) + intercept)).^2;
    Sr = Sr + Sr_i;
end

Rsquared = (St - Sr)/St;

end
