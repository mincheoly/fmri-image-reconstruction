% Construct the 1-by-2, 2-by-1, and 2-by-2 basis representations of the
% stimulus images.

load('../raw_data.mat');

stimuli_clean_train_1x2 = zeros(1320,90); 
for i = 1:1320
    m = 1;
    for j = 0:9
        for k = 1:9 
            stimuli_clean_train_1x2(i,m) = mean(stimuli_clean_train(i,(10*j + k):(10*j + k +1)));
            m = m +1;
        end
    end
end

train_stimuli_1x2 = cell(90, 1320);
temp = stimuli_clean_train_1x2';
for pix = 1 : 90
    for ex = 1 : 1320
        indicator = zeros(3, 1);
        if (temp(pix,ex) == 0)
            indicator(1) = 1;
        elseif (temp(pix,ex) == 0.5)
            indicator(2) = 1;
        elseif (temp(pix,ex) == 1)
            indicator(3) = 1;
        end
        train_stimuli_1x2{pix, ex} = indicator;
    end
end

stimuli_clean_train_2x1 = zeros(1320,90); 
for i = 1:1320
    m = 1;
    for j = 0:8
        for k = 1:10 
            stimuli_clean_train_2x1(i,m) = mean(stimuli_clean_train(i,[(10*j + k),(10*j + k +10)]));
            m = m +1;
        end
    end
end

train_stimuli_2x1 = cell(90, 1320);
temp = stimuli_clean_train_2x1';
for pix = 1 : 90
    for ex = 1 : 1320
        indicator = zeros(3, 1);
        if (temp(pix,ex) == 0)
            indicator(1) = 1;
        elseif (temp(pix,ex) == 0.5)
            indicator(2) = 1;
        elseif (temp(pix,ex) == 1)
            indicator(3) = 1;
        end
        train_stimuli_2x1{pix, ex} = indicator;
    end
end

stimuli_clean_train_2x2 = zeros(1320,81); 
for i = 1:1320
    m = 1;
    for j = 0:8
        for k = 1:9
            stimuli_clean_train_2x2(i,m) = mean(stimuli_clean_train(i,[(10*j + k),(10*j + k +1),(10*j + k +10),(10*j + k +11)]));
            m = m +1;
        end
    end
end

train_stimuli_2x2 = cell(81, 1320);
temp = stimuli_clean_train_2x2';
for pix = 1 : 81
    for ex = 1 : 1320
        indicator = zeros(5, 1);
        if (temp(pix,ex) == 0)
            indicator(1) = 1;
        elseif (temp(pix,ex) == 0.25)
            indicator(2) = 1;
        elseif (temp(pix,ex) == 0.5)
            indicator(3) = 1;
        elseif (temp(pix,ex) == 0.75)
            indicator(4) = 1;
        elseif (temp(pix,ex) == 1)
            indicator(5) = 1;
        end
        train_stimuli_2x2{pix, ex} = indicator;
    end
end

stimuli_clean_test_1x2 = zeros(720,90); 
for i = 1:720
    m = 1;
    for j = 0:9
        for k = 1:9 
            stimuli_clean_test_1x2(i,m) = mean(stimuli_clean_test(i,(10*j + k):(10*j + k +1)));
            m = m +1;
        end
    end
end

test_stimuli_1x2 = cell(90, 720);
temp = stimuli_clean_test_1x2';
for pix = 1 : 90
    for ex = 1 : 720
        indicator = zeros(3, 1);
        if (temp(pix,ex) == 0)
            indicator(1) = 1;
        elseif (temp(pix,ex) == 0.5)
            indicator(2) = 1;
        elseif (temp(pix,ex) == 1)
            indicator(3) = 1;
        end
        test_stimuli_1x2{pix, ex} = indicator;
    end
end

stimuli_clean_test_2x1 = zeros(720,90); 
for i = 1:720
    m = 1;
    for j = 0:8
        for k = 1:10 
            stimuli_clean_test_2x1(i,m) = mean(stimuli_clean_test(i,[(10*j + k),(10*j + k +10)]));
            m = m +1;
        end
    end
end

test_stimuli_2x1 = cell(90, 720);
temp = stimuli_clean_test_2x1';
for pix = 1 : 90
    for ex = 1 : 720
        indicator = zeros(3, 1);
        if (temp(pix,ex) == 0)
            indicator(1) = 1;
        elseif (temp(pix,ex) == 0.5)
            indicator(2) = 1;
        elseif (temp(pix,ex) == 1)
            indicator(3) = 1;
        end
        test_stimuli_2x1{pix, ex} = indicator;
    end
end

stimuli_clean_test_2x2 = zeros(720,81); 
for i = 1:720
    m = 1;
    for j = 0:8
        for k = 1:9
            stimuli_clean_test_2x2(i,m) = mean(stimuli_clean_test(i,[(10*j + k),(10*j + k +1),(10*j + k +10),(10*j + k +11)]));
            m = m +1;
        end
    end
end

test_stimuli_2x2 = cell(81, 720);
temp = stimuli_clean_test_2x2';
for pix = 1 : 81
    for ex = 1 : 720
        indicator = zeros(5, 1);
        if (temp(pix,ex) == 0)
            indicator(1) = 1;
        elseif (temp(pix,ex) == 0.25)
            indicator(2) = 1;
        elseif (temp(pix,ex) == 0.5)
            indicator(3) = 1;
        elseif (temp(pix,ex) == 0.75)
            indicator(4) = 1;
        elseif (temp(pix,ex) == 1)
            indicator(5) = 1;
        end
        test_stimuli_2x2{pix, ex} = indicator;
    end
end
