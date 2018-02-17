figure(1)
% imshow(reshape(test_recon_trunc(:,28)',10,10))
% colormap gray
% imshow(reshape(test_stimuli_orig(28,:),10,10))
subplot(1, 2, 1), imshow(reshape(test_recon_trunc(:,28)',10,10));
subplot(1, 2, 2), imshow(reshape(test_stimuli_orig(28,:),10,10) );
saveas(gcf, 'russ_images/test1.jpg');


figure(2)
subplot(1, 2, 1), imshow(reshape(test_recon_trunc(:,1)',10,10));
subplot(1, 2, 2), imshow(reshape(test_stimuli_orig(1,:),10,10));
saveas(gcf, 'russ_images/test2.jpg');

figure(3)
subplot(1, 2, 1), imshow(reshape(test_recon_trunc(:,16)',10,10))
subplot(1, 2, 2), imshow(reshape(test_stimuli_orig(16,:),10,10))
saveas(gcf, 'russ_images/test3.jpg');

figure(4)
subplot(1, 2, 1), imshow(reshape(test_recon_trunc(:,23)',10,10))
subplot(1, 2, 2), imshow(reshape(test_stimuli_orig(23,:),10,10))
saveas(gcf, 'russ_images/test4.jpg');