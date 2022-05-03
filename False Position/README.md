# False Position
### This function is designed to use the faulse posiotion root finding method to estimate unknown values in a user-inputed anonymous function.

#### INPUTS

* func: the function being evaluated, must be an anonymous function
* xl: lower guess, f(xl) must have different sign then f(xu)
* xu: upper guess, f(xu) must have different sign then f(xl)
* es: desired reletive error, defaults to 0.001 percent
* maxt: the maximum iterations to run before ending while loop, defaults to 200
* varargin: any additional parameters to be used by the function

#### OUTPUTS
* root: the estimated root location
* fx: the function evaluated at said root location
* ea: the approximate reletive error as a percent
* iter: the number of iterations preformed
