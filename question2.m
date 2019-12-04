
function question2()
    pop = createPop();
    answerQ2a(pop)
    answerQ2b(pop)
end

function pop = createPop()
    pop = readtable('population.csv');
end

function answerQ2a(pop)

    sample = iid_sample(pop, 50);
    disp('iid sum up')
    [mean, median, std] = sample_sum_up(sample.Charges)
    figure()
    boxplot(sample.Charges);
    figure()
    cdfplot(sample.Charges);
    ksDistance = ks_distance(sample.Charges, pop.Charges)
end

function answerQ2b(pop)

    A = zeros(4,500);

    for i = 1:500
        t = iid_sample(pop, 50);
       [ A(1,i), A(2 ,i), A(3 ,i)] = sample_sum_up(t.Charges);
        A(4 ,i) = ks_distance(t.Charges, pop.Charges);
    end
    figure()
    bi = histogram(A(1,:));
    figure()
    bii = histogram(A(2,:));
    figure()
    biii = histogram(A(3,:));
    figure()
    biv = histogram(A(4,:));
end


        