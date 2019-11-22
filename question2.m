function createPop
    pop = population(readtable(’data.csv’), 13);
    writetable(pop, ’population.csv’);
end


function answerQ2a(pop)
    sample = iid_sample(pop, 50);
    ai = sample_sum_ip(sample.charges)
    aii = boxplot(sample.charges)
    cdfplot(sample.charges)
    aiii = ks_distance(sample.charges, pop.charges)
end

function answerQ2b(pop)
     
end