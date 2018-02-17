net_archs = { [10 10], [15 15], [20 20], [30 30], [30 15], [30 20 10], [15 5], [10 5], [10 10 10], [5 5]};

for i = 1 : length(net_archs);
pix = 99;
pix_train_stimuli = cell2mat(  train_stimuli(pix, :)   );
net = feedforwardnet(net_archs{i});
net = train(net, train_data, pix_train_stimuli);
    
count = 0;
for test = 1 : 720
        predictions = net( test_data(:, test) );
        [~, max_idx] = max(predictions);
        predict = max_idx - 1;
        real = stimuli_clean_test(test, pix);
         if predict == real
            count = count + 1;
         end    
end
disp(net_archs{i});
disp(count / 720);
disp('-----');
end