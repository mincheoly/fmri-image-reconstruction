predictor_1x1 = cell(1, 100);
predictor_2x1 = cell(1, 90);
predictor_1x2 = cell(1, 90);
predictor_2x2 = cell(1, 81);

%Train neural nets for 1x1 predictor, each pixel gets 5 neural nets
for pix = 1 : 100
    pix_train_stimuli = cell2mat(  train_stimuli(pix, :)   );
    neural_nets = cell(1, 5);
    col = mod(pix, 10);
    row = floor(pix/10) + 1;
    net_arch = -1;
    
    %narrow the scope as you go
    if row == 1 || row == 10 || col == 1 || col == 0
        net_arch = [20 20];
    elseif row == 2 || row == 9 || col == 2 || col == 9
        net_arch = [15 15];
    elseif row == 3 || row == 8 || col == 3 || col == 8
        net_arch = [10 5];
    elseif row == 4 || row == 7 || col == 4 || col == 7
        net_arch = [30 30];
    else
        net_arch = [10 10];
    end
    
    net = feedforwardnet(net_arch);
    for t = 1 : 5
        neural_nets{t} = train(net, train_data, pix_train_stimuli);
        neural_nets{t} = train(neural_nets{t}, train_data, pix_train_stimuli);
    end
    predictor_1x1{pix} = neural_nets;    
end

%Train neural nets for 1x2 nets
for pix = 1 : 90
    pix_train_stimuli = cell2mat(  train_stimuli_1x2(pix, :)   );
    neural_nets = cell(1, 5);
    net_arch = [30 30];
    net = feedforwardnet(net_arch);
    for t = 1 : 5
        neural_nets{t} = train(net, train_data, pix_train_stimuli);
        neural_nets{t} = train(neural_nets{t}, train_data, pix_train_stimuli);
    end
    predictor_1x2{pix} = neural_nets;    
end

%Train neural nets for 2x1 nets
for pix = 1 : 90
    pix_train_stimuli = cell2mat(  train_stimuli_2x1(pix, :)   );
    neural_nets = cell(1, 5);
    net_arch = [30 30];
    net = feedforwardnet(net_arch);
    for t = 1 : 5
        neural_nets{t} = train(net, train_data, pix_train_stimuli);
        neural_nets{t} = train(neural_nets{t}, train_data, pix_train_stimuli);
    end
    predictor_2x1{pix} = neural_nets;    
end

%Train neural nets for 2x2 nets
for pix = 1 : 81
    pix_train_stimuli = cell2mat(  train_stimuli_2x2(pix, :)   );
    neural_nets = cell(1, 5);
    net_arch = [30 30];
    net = feedforwardnet(net_arch);
    for t = 1 : 5
        neural_nets{t} = train(net, train_data, pix_train_stimuli);
        neural_nets{t} = train(neural_nets{t}, train_data, pix_train_stimuli);
    end
    predictor_2x2{pix} = neural_nets;    
end