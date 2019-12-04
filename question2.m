
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
    moyeneesDesMoyennes = mean(A(1, :))
    moyeneesDesMedianes = mean(A(2, :))
    moyeneesDesSTD = mean(A(3, :))
    moyeneesDesKS = mean(A(4, :))
    
    figure()
    bi = histogram(A(1,:));
    title('Moyennes des frais hospitaliers de 500 �chatillons iid de taille 50')
    xlabel('Moyennes') 
    ylabel('Occurences') 
    
    figure()
    bii = histogram(A(2,:));
    title('M�dianes des frais hospitaliers de 500 �chatillons iid de taille 50')
    xlabel('M�dianes') 
    ylabel('Occurences') 
    figure()
    biii = histogram(A(3,:));
    title('�carts-type des frais hospitaliers de 500 �chatillons iid de taille 50')
    xlabel('�carts-type') 
    ylabel('Occurences') 
    figure()
    biv = histogram(A(4,:));
    title('Distances KS des frais hospitaliers de 500 �chatillons iid\n de taille 50 par rapport � la populatiion totale')
    xlabel('Distances de Kolmogorov Smirnov') 
    ylabel('Occurences') 
end


        