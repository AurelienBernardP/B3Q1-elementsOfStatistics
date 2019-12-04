function prop = proportion(x, y)
%   PROPORTION(X, Y) gives the proportion of elements in X that are smaller
%   or equal than Y and greater than the charges of Smith.
%
%   X : N-by-1 double
%   Y : 1-by-1 double
%   PROP : 1-by-1 double

	smithCharges = groupData(x.LastName == 'Smith', 7);
	prop = (sum(x<=y & x> smithCharges))/size(x, 1);
    
end