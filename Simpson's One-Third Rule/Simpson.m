function [I] = Simpson(x, y)
% This function is designed to numerically evaluate an integral with 
% Simpson's 1/3 Rule.
%
% INPUTS
%           x: the vector of equally spaced independent variable
%           y: the vector of function values with respect to x
% OUTPUTS
%           I: the numerical integral calculated

% check  for input number
if nargin ~= 2
    error('only input two vectors')
end

% check sizes of x and y
Ly = length(y);
Lx = length(x);
L = Lx;

if Ly ~= Lx
    error('the length of your inputs do not match')
end

% check spacing of x
for k = 1:(Lx-1)
    if x(1) - x(2) ~= x(k) - x(k+1)
        error('the indipendant variable vector must be equaly spaced')
    end
end

% if composite trapazoidal rule is needed
z = L;
I = 0;
if rem(length(x),2) == 0
    warning('the number of intervals is odd, the Trapazoidal Rule will be used for the final interval')
    
    z = (L-1);
    
    xAside = x(z:L);
    yAside = y(z:L);
    
    x = x(1:z);
    y = y(1:z);
      
    aNew = xAside(1);
    bNew = xAside(2);
    
    % using composite trapazoidal rule
    trapI = (bNew - aNew)*(yAside(1) + yAside(2))/2;
    
    % summing odd
    odd = y(2:2:z-1);
    sumOdd = sum(odd);
    
    % summing even
    even = y(3:2:z-1);
    sumEven = sum(even);
    
    % using simpson's 1/3 rule
    a = x(1);
    b = x(z);
    i = (b - a)/(3*(z-2))*(y(1) + 4*sumOdd + 2*sumEven + y(z));
    I = I + i;
end

% if only simpson's 1/3 rule is needed
if rem(length(x),2) ~= 0
    
    % summing odd
    odd = y(2:2:z-1);
    sumOdd = sum(odd);
    
    % summing even
    even = y(3:2:z-1);
    sumEven = sum(even);
    
    % using simpson's 1/3 rule
    a = x(1);
    b = x(z);
    I = (b - a)/(3*(z-1))*(y(1) + 4*sumOdd + 2*sumEven + y(z));
end

if L == 2
    I = trapI;
end
end