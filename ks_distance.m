function dist = ks_distance(x, y)
%   KS_DISTANCE(X, Y) is the Kolmogorov-Smirnov distance between X and Y.
%
%   X : N-by-1 double
%   Y : M-by-1 double
%   DIST : 1-by-1 double

   [~,~,dist] = kstest2(x, y);

end