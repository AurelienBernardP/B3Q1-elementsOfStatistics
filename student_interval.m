function [lower_bound, upper_bound] = student_interval(x, perc)
%   STUDENT_INTERVAL(X, PERC) computes the lower and upper bounds of the 100*PERC percent Student confidence interval
%   of X s distribution mean.
%
%   X : N-by-1 double
%   PERC : 1-by-1 double in [0, 1]
%   LOWER_BOUND : 1-by-1 double
%   UPPER_BOUND : 1-by-1 double

	sizeX = size(x, 1);
	meanX = mean(x);
	stdX = std(x);
    t = tinv(1-((1-perc)/2), sizeX-1);
    
    lower_bound = meanX - t * (stdX/sqrt(sizeX));
    upper_bound = meanX + t * (stdX/sqrt(sizeX));
    
end