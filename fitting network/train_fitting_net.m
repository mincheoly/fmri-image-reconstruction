data = train_data(:,indices);
labels1x1 = stimuli_clean_train(indices,:)';
labels1x2 = stimuli_clean_train_1x2(indices,:)';
labels2x1 = stimuli_clean_train_2x1(indices,:)';
labels2x2 = stimuli_clean_train_2x2(indices,:)';

mynet1x1 = fitnet(25);
mynet1x1 = train(mynet1x1,data,labels1x1);

mynet1x2 = fitnet(25);
mynet1x2 = train(mynet1x2,data,labels1x2);

mynet2x1 = fitnet(25);
mynet2x1 = train(mynet2x1,data,labels2x1);

mynet2x2 = fitnet(25);
mynet2x2 = train(mynet2x2,data,labels2x2);

checks1x1 = mynet1x1(data);
checks1x2 = mynet1x2(data);
checks2x1 = mynet2x1(data);
checks2x2 = mynet2x2(data);

preds1x1 = mynet1x1(test_data(:,[1:30, 241:270]));
preds1x2 = mynet1x2(test_data(:,[1:30, 241:270]));
preds2x1 = mynet2x1(test_data(:,[1:30, 241:270]));
preds2x2 = mynet2x2(test_data(:,[1:30, 241:270]));

my_lambdas = find_lambdas(checks1x1, checks1x2, checks2x1, checks2x2, labels1x1);
check = apply_lambdas(checks1x1, checks1x2, checks2x1, checks2x2, my_lambdas);
check(check > 1) = 1;
check(check < 0) = 0;
train_mse = (1/30000)*sum(sum((check - labels1x1).^2));

preds_final = apply_lambdas(preds1x1, preds1x2, preds2x1, preds2x2, my_lambdas);

preds_final(preds_final > 1) = 1;
preds_final(preds_final < 0) = 0;

test_mse = (1/6000)*sum(sum((preds_final - test_stimuli_orig').^2));

% for i = 1:60
%     imagesc(reshape(preds_final(:,i),10,10))
%     colormap gray
%     pause(0.5)
% end