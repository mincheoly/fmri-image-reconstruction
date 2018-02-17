figure(1)
subplot(1, 2, 1), imshow(reshape(preds_final(:,28)',10,10));
subplot(1, 2, 2), imshow(reshape(test_stimuli_orig(28,:),10,10));
saveas(gcf, 'fitnet_images/test1.jpg');

figure(2)
subplot(1, 2, 1), imshow(reshape(preds_final(:,1)',10,10));
subplot(1, 2, 2), imshow(reshape(test_stimuli_orig(1,:),10,10));
saveas(gcf, 'fitnet_images/test2.jpg');

figure(3)
subplot(1, 2, 1), imshow(reshape(preds_final(:,16)',10,10))
subplot(1, 2, 2), imshow(reshape(test_stimuli_orig(16,:),10,10))
saveas(gcf, 'fitnet_images/test3.jpg');

figure(4)
subplot(1, 2, 1), imshow(reshape(preds_final(:,23)',10,10))
subplot(1, 2, 2), imshow(reshape(test_stimuli_orig(23,:),10,10))
saveas(gcf, 'fitnet_images/test4.jpg');