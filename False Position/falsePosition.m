function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
% This function is designed to use the faulse posiotion root finding method
% to estimate unknown values in a user-inputed anonymous function.
% 
% INPUTS
%           func: the function being evaluated, must be an anonymous
%                 function
%           xl: lower guess, f(xl) must have different sign then f(xu)
%           xu: upper guess, f(xu) must have different sign then f(xl)
%           es: desired reletive error, defaults to 0.001 percent
%           maxt: the maximum iterations to run before ending while loop,
%                 defaults to 200
%           varargin: any additional parameters to be used by the function
%
% OUTPUTS
%           root: the estimated root location
%           fx: the function evaluated at said root location
%           ea: the approximate reletive error as a percent
%           iter: the number of iterations preformed

% setting the stage
fxl = func(xl);
fxu = func(xu);
iter = 0;
fx = 0;

while true
    
    % checking for bad inputs
    if fxl * fxu > 0
        error('error: these guesses do not bracket a root')
    elseif nargin < 2
        error('error: not enough inputs')
    end
    
    % checking if initial guesses were correct
    if fxl == 0
        root = xl;
        break
    elseif fxu == 0
        root = xu;
        break
    end
    
    % checking for optional inputs
    if ~exist('maxit','var')
        maxit = 200;  
    end
    if ~exist('es','var')
        es = 0.001;
    end

    % calculating the root
    ea = es + 1;
    while ea > es
        fxOld = fx;
        
        % checking iteration
        iter = iter + 1;
        if iter >= maxit
            fprintf('error: ran over maximum iteration limit. current root is %e1.3','x')
            break
        end
        
        % using formula
        fxu = func(xu);
        fxl = func(xl);
        x = xu - (fxu*(xl - xu))/(fxl - fxu);
        fx = func(x);
        
        if fx*fxu > 0
            xu = x;
        elseif fx*fxl > 0
            xl = x;
        end
        
        % error calculating
        if fx == 0
            ea = 0;
        else
            ea = abs((fx - fxOld)/fx)*100;
        end 
        
    end
    
    root = x;
    
    break
    
end
end

    