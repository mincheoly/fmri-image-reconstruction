%===deal with training data=========================

num_real_data = size(data_clean_train, 1) / 3;
avg_train_data = zeros( num_real_data, size(data_clean_train, 2) );
avg_train_stimuli = zeros( num_real_data, size(stimuli_clean_train, 2) );
for i = 1 : num_real_data
    avg_train_data(i, :) = sum(  data_clean_train( (i-1)*3+1:(i-1)*3+3 , :) ) / 3;
    avg_train_stimuli(i, :) = sum(  stimuli_clean_train( (i-1)*3+1:(i-1)*3+3 , :) ) / 3;
end
avg_train_data = avg_train_data';
avg_train_stimuli = avg_train_stimuli';

%===deal with testing data ========================

num_real_data_test = size(data_clean_test, 1) / 6;
avg_test_data = zeros( num_real_data_test, size(data_clean_test, 2) );
avg_test_stimuli = zeros( num_real_data_test, size(stimuli_clean_test, 2) );
for i = 1 : num_real_data_test
    avg_test_data(i, :) = sum(  data_clean_test( (i-1)*6+1:(i-1)*6+6 , :) ) / 6;
    avg_test_stimuli(i, :) = sum(  stimuli_clean_test( (i-1)*6+1:(i-1)*6+6 , :) ) / 6;
end
avg_test_data = avg_test_data';
avg_test_stimuli = avg_test_stimuli';