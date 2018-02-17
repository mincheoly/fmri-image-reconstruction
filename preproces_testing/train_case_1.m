%testing environments:
% 50 random examples
% 4 hidden notes
% normalized
% two element outputs

preprocess_data;

test_idx = 54;
%train the nets
test_net_fiftyfour = feedforwardnet(4);

random_indices = randperm(440, 50);
random_train_data = avg_train_data(:, random_indices);
random_train_stimuli = cell2mat( avg_train_stimuli_cell( test_idx, random_indices) );

test_net_fiftyfour = train(test_net_fiftyfour, random_train_data, random_train_stimuli);


%test the nets
count = 0;
for i = 1 : 120
    predict = round( test_net_fiftyfour( avg_test_data(:, i) ) );
    real = round( avg_test_stimuli(test_idx, i) );
    if predict == real
        count = count + 1;
    end
end
disp(count / 720);

%save the nets
save('test_case_1', test_net_fiftyfour);