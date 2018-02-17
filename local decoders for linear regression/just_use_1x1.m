predict_test_stimuli_just_1x1 = zeros(100, num_ex);
for example = 1 : 60
    for pix = 1 : 100
        %for each of the five nets
        predictions = zeros(2, 5);
        for t = 1 : 5
            predictions(:, t) = predictor_1x1{pix}{t}( decoder_test_data(: , example) );
        end
        predictions = mean(predictions, 2);
        predict = predictions(2) / (predictions(1) + predictions(2) );
        predict_test_stimuli_just_1x1(pix, example) = predict;
    end
    fprintf('Example %d done \n', example);
end