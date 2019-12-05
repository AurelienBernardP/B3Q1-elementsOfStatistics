function question3(size)
    
    pop = readtable('population.csv');
    x = pop.BMI;
    meanX = zeros(100:1);
    medianX = zeros(100:1);
    for i=1:100
        meanX(i, 1) = mean(iid_sample(x, size));
        medianX(i, 1) = median(iid_sample(x, size));
    end
    
    meanBias = mean(meanX(:,1)) - mean(x)
    meanVariance = var(meanX(:,1))
    medianBias = mean(medianX(:,1)) - median(x)
    medianVariance = var(medianX(:,1))
    
    figure()
    histogram(x, 20);
    title('BMI de la population')
    xlabel('BMI en kg/m^2')
    ylabel('Nombre de personnes')
    
end
