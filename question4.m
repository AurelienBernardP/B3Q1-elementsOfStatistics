function question4(pop)
    smokingPop = pop.Smoker == 0;
    nonSmokingPop = pmp.Smoker == 1;
    chargeDifference = mean(smokingPop.Charges) - mean(nonSmokingPop.Charges);
end

function nbRejection = test0HypoFullPop(pop, chargeDifference)
    nbRejection = 0;
    for i = 1:100
        sample = iid_sample(pop,50);
        nbRejections = test0Hypo(sample,chargeDifference) + nbRejection;test0Hypo(sample, chargeDifference);
    end
end

function nbRejection = test0HypoElderPop(pop,chargeDifference)
    elderPop = pop.Age > 50;
    nbRejection = 0;
    for i = 1:100
        sample = iid_sample(pop,50);
        nbRejections = test0Hypo(sample,chargeDifference) + nbRejection;
    end
end

function rejected = test0Hypo(sample,hypothesisVal)

end