function [L, U, P] = luFactor(A)
% This function is designed to use LU decomposition with pivotiing to help 
% solve a systems of equations.
%
% INPUTS
%           A: coefficient matrix
%
% OUTPUTS
%	        L: lower triangular matrix
%	        U: upper triangular matrix
%           P: the pivot matrix

% checking to see if square
[n,m] = size(A);
if m ~= n
    error('dimentions of matrix do not match')
end

% checking to see if input number is good
if nargin ~= 1
    error('only input one argument')
end

% creating L, U, and P matrix statring points
U = zeros(n,m);
U(1,:) = A(1,:);
P = eye(n,m);
L = zeros(n,m);
v = 0;

for i = 1:n-1
    for k = 1:m-i
        % checking if pivoting is necessary
        [maximum,ind] = max(abs(A([i:m],i)));
        if maximum > abs(A(i,i))
            A([i+v ind],:) = A([ind i+v],:);
            P([i+v ind],:) = P([ind i+v],:);
            L([i+v ind],:) = L([ind i+v],:);
        end
        % finding what value to multiply top equation by
        a = A(k+i,i)/A(i,i);
        % adding it to the L matrix
        L(k+i,i) = a;
        % completing the elimination process and adding to the U matrix
        eq = A(i,:)*a;
        A(k+i,:) = A(k+i,:) - eq;
        U = A;
    end
    v = v + 1;
end
for z = 1:n
    L(z,z) = 1;
end
end
