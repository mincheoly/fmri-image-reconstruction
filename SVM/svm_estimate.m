stim_train = clean_stimuli_train;
dat_train = clean_data_train;

stim_test = clean_stimuli_test;
dat_test = clean_data_test;

stim_train_avg = zeros(440,100);
for a = 1:440
    stim_train_avg(a,:) = mean(stim_train(a:(a+2),:),1);
end
stim_train_avg(stim_train_avg >= 0.5) = 1;
stim_train_avg(stim_train_avg < 0.5) = 0;

dat_train_avg = zeros(440,6046);
for a = 1:440
    dat_train_avg(a,:) = mean(dat_train(a:(a+2),:),1);
end

stim_test_avg = zeros(120,100);
for a = 1:120
    stim_test_avg(a,:) = mean(stim_test(a:(a+5),:),1);
end
stim_test_avg(stim_test_avg >= 0.5) = 1;
stim_test_avg(stim_test_avg < 0.5) = 0;

dat_test_avg = zeros(120,6046);
for a = 1:120
    dat_test_avg(a,:) = mean(dat_test(a:(a+5),:),1);
end

dat_train_avg_normed = zeros(size(dat_train_avg));
mean_train = mean(dat_train_avg,1);
std_train = std(dat_train_avg,1,1);
for i = 1:size(dat_train_avg,1)
    dat_train_avg_normed(i,:) = (dat_train_avg(i,:) - mean_train)./std_train;
end

dat_test_avg_normed = zeros(size(dat_test_avg));
mean_test = mean(dat_test_avg,1);
std_test = std(dat_test_avg,1,1);
for i = 1:size(dat_test_avg,1)
    dat_test_avg_normed(i,:) = (dat_test_avg(i,:) - mean_test)./std_test;
end

stim_train_est = zeros(size(stim_train_avg));
stim_test_est = zeros(size(stim_test_avg));

kernels = {'linear','quadratic','polynomial','rbf','mlp'};
cvec = [0.01 0.1 1 2 5 10 100];
rmse_mat2 = zeros(length(kernels),length(cvec));
rmse_test_mat2 = zeros(length(kernels),length(cvec));

for k = 1:length(kernels)
for j = 1:length(cvec)
    disp(cvec(j))
    for i = 1:100
        disp(i)
        SVMStruct = svmtrain(dat_train_avg,stim_train_avg(:,i),'kernel_function',kernels{k},'boxconstraint',cvec(j));
        stim_train_est(:,i) = svmclassify(SVMStruct,dat_train_avg_normed); 
        stim_test_est(:,i) = svmclassify(SVMStruct,dat_test_avg_normed);
    end
    
    rmse_mat2(k,j) = sqrt(sum(sum((stim_train_avg - stim_train_est).^2))/(size(stim_train_avg,1)*size(stim_train_avg,2)));
    rmse_test_mat2(k,j) = sqrt(sum(sum((stim_test_avg - stim_test_est).^2))/(size(stim_test_avg,1)*size(stim_test_avg,2)));
end
end
