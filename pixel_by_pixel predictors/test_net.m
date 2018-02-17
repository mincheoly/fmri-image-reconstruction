count = 0;
for test = 1 : 720
        predictions = zeros(2, num_net);
        for j = 1 : num_net
            predictions(:, j) = image_predictor{1}{j} ( test_data(:, test) );
        end
        predictions = mean(predictions, 2);
        [~, max_idx] = max(predictions);
        predict = max_idx - 1;
        real = stimuli_clean_test(test, 1);
         if predict == real
            count = count + 1;
         end    
end
disp(count / 720);