clear;
clc;
load('../raw_data.mat');
%designate training data
norm_data_clean_train = (data_clean_train - min(min(data_clean_train))  ) / ( max(max(data_clean_train)) - min(min(data_clean_train)) );
[coeff,score,latent,tsquared,explained,mu] = pca(norm_data_clean_train);
train_data = score(:, 1:50)';

%designate testing data
norm_data_clean_test = (data_clean_test - min(min(data_clean_test))  ) / ( max(max(data_clean_test)) - min(min(data_clean_test)) );
train_mean = mean(norm_data_clean_train);
centered_test_data = bsxfun( @minus, norm_data_clean_test, train_mean );
test_data = ( centered_test_data* coeff(:, 1:50) )';

%make training stimuli cell
train_stimuli = cell(100, 1320);
temp = stimuli_clean_train';
for pix = 1 : 100
    for ex = 1 : 1320
        indicator = zeros(2, 1);
        indicator( temp(pix, ex) + 1 ) = 1;
        train_stimuli{pix, ex} = indicator;
    end
end