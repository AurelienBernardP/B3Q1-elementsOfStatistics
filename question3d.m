
function [cptStudent, cptGauss] = answerQ3d(x, perc)

    cptStudent = 0;
    cptGauss = 0;
    sigma = std(x);
    meanBMI = mean(x);
    
    for i=1:100
        new_sample = iid_sample(x, 20);
        [lower_Student, upper_Student] = student_interval(new_sample, perc);
        [lower_Gauss, upper_Gauss] = gauss_interval(new_sample, perc, sigma);
        
        if meanBMI >= lower_Student && meanBMI <= upper_Student
            cptStudent = cptStudent + 1;
        end
        
        if meanBMI >= lower_Gauss && meanBMI <= upper_Gauss
            cptGauss = cptGauss + 1;
        end

    end

end

