net_archs = { [10 10], [15 15], [20 20], [30 30], [30 15], [30 20 10], [15 5], [10 5], [10 10 10], [5 5], [50 50], [70 70]};
pix = 88;
for i = 1 : length(net_archs);

    pix_train_stimuli = cell2mat(  train_stimuli_1x2(pix, :)   );
    net = feedforwardnet(net_archs{i});
    net = train(net, train_data, pix_train_stimuli);

    count = 0;
    for test = 1 : 720
            predictions = net( test_data(:, test) );
            [~, max_idx] = max(predictions);
            if max_idx == 1
                predict = 0;
            end
            if max_idx == 2
                predict = 0.5;
            end
            if max_idx == 3
                predict = 1;
            end
                    
            real = stimuli_clean_test_1x2(test, pix);
             if predict == real
                count = count + 1;
             end    
    end
    disp(net_archs{i});
    disp(count / 720);
    disp('-----');
end