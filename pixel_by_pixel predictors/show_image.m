avg_images = cell(1, 20);
for index = 1 : 20
    image_indices = (((index-1)*6)+1):(((index-1)*6)+1+5);
    sum_image = zeros(10, 10);
    for i = image_indices(1) : image_indices(6)
        sum_image = sum_image + all_images_predict{i};
    end
    avg_images{index} = sum_image/6;
    
    subplot(1,2,1), imshow( avg_images{index} );
    subplot(1,2,2), imshow( all_images_true{image_indices(1)});
    filename = ['images/test_' num2str(index) '.jpg'];
    saveas(gcf, filename);
end