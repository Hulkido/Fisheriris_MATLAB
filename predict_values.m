function testy=predict_values(trainx,trainy,testx)
a=grp2idx(trainy);  %converting strings into values i.e 'setosa'=1 and so on 
b=(a==3);   % b is a bool matrix having 1 at places where 3 lies in a and 0 at other position i.e if a[4]=3 implies b[4]=1
a(b,:)=2;   %converting all the 3 into 2 beacause we want to first classify data as 'setosa' and 'not setosa'
c=(a==2);   % c contains indexes of those values only where a==2 doing so to convert trainx into data of flowers other than 'setosa' to train svmmodel2 
svmmodel1=fitcsvm(trainx,a,'KernelFunction','RBF');%This model training is to distinguish between 'setosa' and other flowers
svmmodel2=fitcsvm(trainx(c,:),trainy(c),'KernelFunction','RBF');%This will distinguish between 'verginica' and 'versicolor'
pred=predict(svmmodel1,testx); %ped contains 1 and 2 only,1 where flower is 'setosa' and 2 where 'not setosa' 
str=string(pred); %converting into string so that later on 1 can be replaced with 'setosa'
testy=str;   %testy should have dimension equal to pred and should also be string matrix so best way is to make it equal to str
for i=1:size(pred,1)
    if pred(i)~=1
        testy(i)=predict(svmmodel2,testx(i,:));     %this flower is converting 1 into 'setosa' and by svmmodel2 checking whether 2 should be replaced by 'verginica' or 'versicolor'
    else
        testy(i)={'setosa'};
    end
end
        