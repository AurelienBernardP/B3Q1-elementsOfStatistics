function [cptStudent] = student_interval(x)
%function [lower_bound, upper_bound] = student_interval(x, perc)
%   STUDENT_INTERVAL(X, PERC) computes the lower and upper bounds of the 100*PERC percent Student confidence interval
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
    cptStudent = 0;
    meanBMI = mean(x);

    lower_bound = zeros(1,100);
    upper_bound = zeros(1,100);
    
    %refaire formule pour perc
    for i=1:100
        lower_bound(i) = meanX(i,1) - 2.093 * (std(iid_sample(x, 20))/sqrt(20));
        upper_bound(i) = meanX(i,1) + 2.093 * (std(iid_sample(x, 20))/sqrt(20));
        
        if meanBMI >= lower_bound(i) && meanBMI <= upper_bound(i)
            cptStudent = cptStudent + 1;
        end
    end
    
end