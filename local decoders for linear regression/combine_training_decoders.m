stimuli_train = stimuli_clean_train(indices,:)';
lambdas = find_lambdas(predict_train_stimuli_1x1, predict_train_stimuli_1x2, predict_train_stimuli_2x1, predict_train_stimuli_2x2, stimuli_train);
