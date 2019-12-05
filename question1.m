

function question1()
    pop = readtable('test.csv');
    chargesPop = pop.Charges;
    
    figure()
    histogram(chargesPop, 20);
    title('Frais hospitaliers de la population')
    xlabel('Frais hospitaliers en dollar')
    ylabel('Nombre de personnes')

    figure()
    boxplot(chargesPop);
    title('Frais hospitaliers de la population');
    ylabel('Frais hospitaliers en dollar');

    figure()
    cdfplot(chargesPop);
    title('Polygone des frequences cumulees des frais hospitaliers');
    xlabel('Frais hospitaliers en dollar');
    ylabel('Frequence cumulee');

    male = pop(pop.Sex == 0, :);
    figure()
    scatter(male.Charges,male.Age);
    title('Frais hospitaliers des hommes selon leurs ages')
    xlabel('Frais hospitaliers en dollar')
    ylabel('Ages')
    corr_m = correlation(male.Charges,male.Age)
    
    female = pop(pop.Sex == 1, :);
    figure()
    scatter(female.Charges,female.Age);
    title('Frais hospitaliers des femmes selon leurs ages')
    xlabel('Frais hospitaliers en dollar')
    ylabel('Ages')
    corr_f = correlation(female.Charges,female.Age)

    male = pop(pop.Sex == 0 & pop.Charges<18786, :);
    figure()
    scatter(male.Charges,male.Age);
    title('Frais hospitaliers des hommes selon leurs ages')
    xlabel('Frais hospitaliers en dollar')
    ylabel('Ages')
    corr_nm = correlation(male.Charges,male.Age)

    female = pop(pop.Sex == 1 & pop.Charges<18786, :);
    figure()
    scatter(female.Charges,female.Age);
    title('Frais hospitaliers des femmes selon leurs ages')
    xlabel('Frais hospitaliers en dollar')
    ylabel('Ages')
    corr_nf = correlation(female.Charges,female.Age)

    smithCharges = pop(strcmp(pop.LastName, 'Smith'),:).Charges;
    [mean_x, median_x, std_x] = sum_up(chargesPop)
    [lower_inter, upper_inter] = normal_interval(chargesPop)
    prop_1b = proportion(chargesPop, smithCharges)
    prop_1c = proportion(chargesPop, upper_inter) - proportion(chargesPop, lower_inter)
    [first_q, second_q, third_q] = quartiles(chargesPop)
    prop_1d =  sum(chargesPop > third_q + (0.5 * (third_q - first_q)))
    prop_1e = proportion(chargesPop, 25000) - proportion(chargesPop, smithCharges)
    
    
end
