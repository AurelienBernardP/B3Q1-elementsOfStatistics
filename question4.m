

function question4()
    pop = readtable('population.csv');
    smokingPop = pop(pop.Smoker == 0, :);
    nonSmokingPop = pop(pop.Smoker == 1,:);
    chargeDifference = mean(smokingPop.Charges) - mean(nonSmokingPop.Charges);
    all = test0HypoFullPop(smokingPop,nonSmokingPop, chargeDifference)
    elder = test0HypoElderPop(pop,chargeDifference)
end

function nbRejection = test0HypoFullPop(smokingPop,nonSmokingPop, chargeDifference)
   nbRejection = 0;
   
   for i = 1:100
      smokingSample = iid_sample(smokingPop, 50);
      nonSmokingSample = iid_sample(nonSmokingPop, 50);
      nbRejection = test0Hypo(chargeDifference,smokingSample,nonSmokingSample) + nbRejection;
   
   end
end

function nbRejections = test0HypoElderPop(pop,chargeDifference)
   elderPop =  pop(pop.Age > 50,:);
   nbRejection = 0;
   smokingPop = elderPop(elderPop.Smoker == 0, :);
   nonSmokingPop = elderPop(elderPop.Smoker == 1, :);
   for i = 1:100
      smokingSample = iid_sample(smokingPop,50);
      nonSmokingSample = iid_sample(nonSmokingPop,50);
      nbRejections = test0Hypo(chargeDifference,smokingSample,nonSmokingSample) + nbRejection;
   end
end

function rejected = test0Hypo(meanDifference, populationSmoker , populationNonSmoker)
   smokingMean = mean(populationSmoker.Charges);
   nonSmokingMean = mean(populationNonSmoker.Charges);
   sampleMeanDifference = smokingMean-nonSmokingMean;
   sampleSTDDifference = abs( std(populationSmoker.Charges)- std(populationNonSmoker.Charges));
   
   calculatedBound =  meanDifference - tinv(0.05,height(populationNonSmoker)-1)*( sampleSTDDifference/sqrt(height(populationNonSmoker)-1));
   
   if(sampleMeanDifference < calculatedBound)
       rejected = 1;
   else
       rejected = 0;
   end
end