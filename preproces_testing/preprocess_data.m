 load('s1_fmri_roi-1to2mm_Th1_fromAna_s1071119ROI_resol10_v6.mat');
format_data;
average_data;
max_train_signal = max(max(avg_train_data) );
max_test_signal = max(max(avg_test_data) );
min_train_signal = min(min(avg_train_data) );
min_test_signal = min(min(avg_test_data) );
avg_train_data = (avg_train_data - min_train_signal) / max_train_signal;
avg_test_data = (avg_test_data - min_test_signal) / max_test_signal;

avg_train_stimuli_cell = cell(size(avg_train_stimuli));

for i = 1 : size(avg_train_stimuli, 1)
    for j = 1 : size(avg_train_stimuli, 2)
        avg_train_stimuli_cell{i, j} = zeros(2, 1);
        avg_train_stimuli_cell{i, j}( avg_train_stimuli(i,j)+1, 1) = 1;
    end
end

