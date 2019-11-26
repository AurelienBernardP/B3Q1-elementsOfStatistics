function question2
    pop = createPop;
    answerQ2a(pop)
    answerQ2b(pop)
end

function pop = createPop
    pop = population(readtable('data.csv'), 13);
    writetable(pop, 'population.csv');
end

function answerQ2a(pop)
    sample = iid_sample(pop, 50);
    disp('iid sum up' + sample_sum_up(sample.Charges));
    boxplot(sample.Charges)
    cdfplot(sample.Charges)
    disp('ks distance between iid sample and total population' + ks_distance(sample.Charges, pop.Charges))
end

function answerQ2b(pop)

    A = zeros(4,500);

    for i = 1:500
        t = iid_sample(pop, 50);
       [ A(1,i), A(2 ,i), A(3 ,i)] = sample_sum_up(t.Charges);
        A(4 ,i) = ks_distance(t.Charges, pop.Charges);
    end
    
    bi = histogram(A(1,:))
    bii = histogram(A(2,:))
    biii = histogram(A(3,:))
    biv = histogram(A(4,:))
end


        