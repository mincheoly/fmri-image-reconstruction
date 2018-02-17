%For train data/images sets of 3 rows represent one image
%for test data/images sets of 6 rows represent one image

load('s1_fmri_roi-1to2mm_Th1_fromAna_s1071119ROI_resol10_v6.mat')

stimuli_full = D.label;
data_full = D.data;

idx = [];
for j = 0:19
    for k = 0:21
        idx = [idx 6*k+11+j*145 6*k+12+j*145 6*k+13+j*145];
    end
end

% Only use these two matrices for training

% Our labels (images the patient looked at). Take a row of stimuli_clean
% and reshape it into a 10-by-10 matrix to see the actual image.
stimuli_clean_train = stimuli_full(idx',2:end);

% Our data inputs (fMRI recordings) where each row corresponds to the image
% in the same row in stimuli_clean. 
data_clean_train = data_full(idx',:);



% Only use these two matrices for testing

idx2 = [];
for j = 0:11
    for k = 0:9
        idx2 = [idx2 12*k+2911+j*130 12*k+2912+j*130 12*k+2913+j*130 12*k+2914+j*130 12*k+2915+j*130 12*k+2916+j*130];
    end
end

stimuli_clean_test = stimuli_full(idx2',2:end);
data_clean_test = data_full(idx2',:);