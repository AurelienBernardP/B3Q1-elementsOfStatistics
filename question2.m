function createPop
    pop = population(readtable(’data.csv’), 13);
    writetable(pop, ’population.csv’);
end

function answerQ2a(pop)
    sample = iid_sample(pop, 50);
    ai = sample_sum_up(sample.charges)
    aii = boxplot(sample.charges)
    cdfplot(sample.charges)
    aiii = ks_distance(sample.charges, pop.charges)
end

function answerQ2b(pop)

    A = zeros(4,500);

    for i = 1:500
        t = iid_sample(pop, 50);
        A[1,2,3][i] = sample_sum_up(t.charges);
        A[4][i] = ks_distance(t.charges, pop.charges);
    end

end