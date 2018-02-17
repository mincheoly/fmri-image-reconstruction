num_images = 120;

all_images_predict = cell(1, num_images);
all_images_true = cell(1, num_images);
%uses variables:

% image_predictor
% test_data
% stimuli_clean_test

for test = 1 : num_images

    image = zeros(1, 100);
    for pix = 1 : 100
        predictions = zeros(2, num_net);
            for j = 1 : num_net
                predictions(:, j) = image_predictor{pix}{j} ( test_data(:, test) );
            end
            predictions = mean(predictions, 2);
            pix_value = predictions(2) / ( predictions(1) + predictions(2) );
            %disp(pix_value);
            image(pix) = pix_value;
    end
    %reshape images predict and true
    reshaped_predict = reshape(image, 10, 10)';
    reshaped_true = reshape(stimuli_clean_test(test, :), 10, 10)';
    
    %save reshaped images
    all_images_predict{1, test} = reshaped_predict;
    all_images_true{1, test} = reshaped_true;
    
    %show reshaped images
    if mod(test, 10) == 0
        filename = ['images_up_to_' num2str(test) '.mat'];
        save(filename, 'all_images_predict');
    end
%     subplot(1,2,1), imshow( reshaped_predict );
%     subplot(1,2,2), imshow( reshaped_true );
%      filename = ['images/test_' num2str(test) '.jpg'];
%      saveas(gcf, filename);
    fprintf('Test Image %d done\n', test);
end
        