stim_train = clean_stimuli_train;
dat_train = clean_data_train;

X = dat_train\stim_train;

stim_train_est = dat_train*X;
stim_train_est(stim_train_est <= 0.5) = 0;
stim_train_est(stim_train_est > 0.5) = 1;

stim_test = clean_stimuli_test;
dat_test = clean_data_test;

stim_test_est = dat_test*X;
stim_test_est(stim_test_est <= 0.5) = 0;
stim_test_est(stim_test_est > 0.5) = 1;

rmse = sqrt(sum(sum((stim_train - stim_train_est).^2))/(size(stim_train,1)*size(stim_train,2)));
rmse_test = sqrt(sum(sum((stim_test - stim_test_est).^2))/(size(stim_test,1)*size(stim_test,2)));