load fisheriris  %loading fisheriris data
[trainx,trainy,testx,testy]=TrainTestSeparation(meas,species,1,1);  %calling TrainTestSeparation function with ratio between train and test is 1:1
predictedy=predict_values(trainx,trainy,testx); %calling function predict_values with input arguments as given by TrainTestSeparation function
ac=accuracy(testy,predictedy) %calling accuracy function which simply prints percentage acccuracy