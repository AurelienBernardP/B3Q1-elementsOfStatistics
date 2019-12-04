function [cptGauss] = gauss_interval(x)
%function [lower_bound, upper_bound] = gauss_interval(x, perc)
%   GAUSS_INTERVAL(X, PERC) computes the lower and upper bounds of the 100*PERC percent Gauss confidence interval
%   of X's distribution mean.
%
%   X : N-by-1 double
%   PERC : 1-by-1 double in [0, 1]
%   LOWER_BOUND : 1-by-1 double
%   UPPER_BOUND : 1-by-1 double

    meanX = zeros(100:1);
    for i=1:100
        meanX(i, 1) = mean(iid_sample(x, 20));
    end
    cptGauss = 0;
    sigma = std(x);
    meanBMI = mean(x);

    lower_bound = zeros(1,100);
    upper_bound = zeros(1,100);
    
    %refaire formule pour perc
    for i=1:100
        lower_bound(i) = meanX(i) - norminv(0.975) * (sigma/sqrt(20));
        upper_bound(i) = meanX(i) + norminv(0.975) * (sigma/sqrt(20));
        
        if meanBMI >= lower_bound(i) && meanBMI <= upper_bound(i)
            cptGauss = cptGauss + 1;
        end
    end

end
