%uses variables:
% avg_train_stimuli_cell
% train_data

image_predictor = cell(1, 100);
net_arch = feedforwardnet(10);
num_net = [10 10];
for pix = 1 : 100
        pix_train_stimuli = cell2mat(  train_stimuli(pix, :)   );
        neural_nets = cell(1, num_net);
        for i = 1 : num_net
            neural_nets{i} = train(net_arch, train_data, pix_train_stimuli);
            neural_nets{i} = train(neural_nets{i}, train_data, pix_train_stimuli);
        end
        image_predictor{pix} = neural_nets;
        fprintf('Pixel# %d done\n', pix);
end
save('case_11_net.mat', 'image_predictor');