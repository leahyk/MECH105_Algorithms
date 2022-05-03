function [A] = specialMatrix(n,m)
% This function is designed to create a special matrix where the first
% column and row are numbers 1 thourgh the inputed number of rows and
% columns, and all other values are the sum of the value above it and to
% the left of it.
%
% INPUTS: 
%           n: number of rows
%           m: number of columns
% OUTPUTS
%           a: the special matrix described above

% testing inputs
if nargin == 2
    disp('loading...')
else
    disp('this function ONLY works for two inputs')
end

% creating an array that is the size needed
A = zeros(n:m);

% filling in first row
q = 0;
for j = 1:n
    A(j,1) = q+1;
    q = q+1;
end

% filling in first column
q = 0;
for i = 1:m
    A(1,i) = q+1;
    q = q+1;
end

% filling in rest of values
for r = 2:n
    for c = 2:m
        A(r,c) = A(r-1,c)+A(r,c-1);
    end
end
end