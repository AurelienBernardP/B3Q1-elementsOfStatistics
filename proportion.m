function prop = proportion(x, y)
%   PROPORTION(X, Y) gives the proportion of elements in X that are smaller
%   or equal than Y.
%
%   X : N-by-1 double
%   Y : 1-by-1 double
%   PROP : 1-by-1 double
    
	prop = (sum(x<=y))/size(x, 1);
    
end