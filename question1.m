

function answerQ1(pop)

    figure()
    histogram(pop.Charges);
    title('Frais hospitaliers de la population')
    xlabel('Frais hospitaliers')
    ylabel('Nombre de personnes')

    figure()
    boxplot(pop.Charges);
    title('Frais hospitaliers de la population');
    ylabel('Frais hospitaliers')

    figure()
    cdfplot(pop.Charges);
    title('Polygone des frequences cumulees des frais hospitaliers');
    xlabel('Frais hospitaliers');
    ylabel('Frequence cumulee');

    male = groupData(pop.Sex == 0, :);
    figure()
    scatter(male.Charges,male.Ages);
    title('Frais hospitaliers des hommes selon leurs ages')
    xlabel('Frais hospitaliers')
    ylabel('Ages')

    female = groupData(pop.Sex == 1, :);
    figure()
    scatter(female.Charges,female.Ages);
    title('Frais hospitaliers des femmes selon leurs ages')
    xlabel('Frais hospitaliers')
    ylabel('Ages')

    male = groupData(pop.Sex == 0 & pop.Charges<18786, :);
    figure()
    scatter(male.Charges,male.Ages);
    title('Frais hospitaliers des hommes selon leurs ages')
    xlabel('Frais hospitaliers')
    ylabel('Ages')

    female = groupData(pop.Sex == 1 & pop.Charges<18786, :);
    figure()
    scatter(female.Charges,female.Ages);
    title('Frais hospitaliers des femmes selon leurs ages')
    xlabel('Frais hospitaliers')
    ylabel('Ages')

end
