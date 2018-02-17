indices = 1:3:900;
num_ex = 300;

%generate predicted train stimuli for 1x1
predict_train_stimuli_1x1 = zeros(100, num_ex);
for ex = 1 : num_ex
    example = indices(ex);
    for pix = 1 : 100
        %for each of the five nets
        predictions = zeros(2, 5);
        for t = 1 : 5
            predictions(:, t) = predictor_1x1{pix}{t}( train_data(: , example) );
        end
        predictions = mean(predictions, 2);
        [~, max_idx] = max(predictions);
        predict = max_idx - 1;
        predict_train_stimuli_1x1(pix, ex) = predict;
    end
    fprintf('Example %d done for 1x2 \n', ex);
end
disp('1x1 done');

%generate predicted train stimli for 1x2
predict_train_stimuli_1x2 = zeros(90, num_ex);
for ex = 1 : num_ex
    example = indices(ex);
    for pix = 1 : 90
        %for each of the five nets
        predictions = zeros(3, 5);
        for t = 1 : 5
            predictions(:, t) = predictor_1x2{pix}{t}( train_data(: , example) );
        end
        predictions = mean(predictions, 2);
        [~, max_idx] = max(predictions);    
        predict = -1;
        if max_idx == 1
            predict = 0;
        end
        if max_idx == 2
            predict = 0.5;
        end
        if max_idx == 3
            predict = 1;
        end
        predict_train_stimuli_1x2(pix, ex) = predict;
    end
    fprintf('Example %d done for 1x2 \n', ex);
end

disp('1x2 done');
%generate predicted train stimuli for 2x1
predict_train_stimuli_2x1 = zeros(90, num_ex);
for ex = 1 : num_ex
    example = indices(ex);
    for pix = 1 : 90
        %for each of the five nets
        predictions = zeros(3, 5);
        for t = 1 : 5
            predictions(:, t) = predictor_2x1{pix}{t}( train_data(: , example) );
        end
        predictions = mean(predictions, 2);
        [~, max_idx] = max(predictions);    
        predict = -1;
        if max_idx == 1
            predict = 0;
        end
        if max_idx == 2
            predict = 0.5;
        end
        if max_idx == 3
            predict = 1;
        end
        predict_train_stimuli_2x1(pix, ex) = predict;
    end
    fprintf('Example %d done for 2x1 \n', ex);
end

%generate predicted train stimuli for 2x2
predict_train_stimuli_2x2 = zeros(81, num_ex);
for ex = 1 : num_ex
    example = indices(ex);
    for pix = 1 : 81
        %for each of the five nets
        predictions = zeros(5, 5);
        for t = 1 : 5
            predictions(:, t) = predictor_2x2{pix}{t}( train_data(: , example) );
        end
        predictions = mean(predictions, 2);
        [~, max_idx] = max(predictions);    
        predict = -1;
        if max_idx == 1
            predict = 0;
        elseif max_idx == 2
            predict = 0.25;
        elseif max_idx == 3
            predict = 0.5;
        elseif max_idx == 4
            predict = 0.75;
        elseif max_idx == 5
            predict = 1;
        end
        predict_train_stimuli_2x2(pix, ex) = predict;
    end
    fprintf('Example %d done for 2x2 \n', ex);
end