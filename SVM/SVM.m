clear all;
load clean_project_data;

data = clean_data_train / 1000;
stimuli = clean_stimuli_train;
stimuli = (stimuli - 0.5) * 2; %Change 0/1 values to -1/+1

numFeatures = length(data(1, :)); %Number of pixels per fMRI reading
numOutputs = length(stimuli(1, :)); %Number of pixels per stimulus
numExamples = length(data(:, 1));
epsilon = 0.001; %Error threshold to stop SGD
lambdaList = [10];
 
%% 
for lambda = lambdaList
    weights = zeros(numOutputs, numFeatures);
    error = zeros(numOutputs, 1); % Percent error per output pixel
    for i = 1:numOutputs
        w = zeros(1, numFeatures);
        prevError = Inf;
        currError = 1;
        t = 1;
        while (prevError - currError > epsilon) || (currError > prevError)
            prevError = currError;
            numWrong = 0;
            for j = 1:numExamples
                eta = 1 / sqrt(numExamples * (t-1) + j);
                features = data(j, :);
                y = stimuli(j, i);
                score = dot(w, features);
                if (score * y < 1) %Hinge loss, can replace with others here.
                    gradient = -1 * features * y + lambda * w;
                    w = w - eta * gradient;
                    numWrong = numWrong + 1;
                end
            end
            fprintf('Lambda: %f, Output pixel: %d, Iteration: %d, Error: %f\n', lambda, i, t, numWrong/numExamples);
            t = t + 1;
            currError = numWrong / numExamples;
        end
        weights(i, :) = w;
        error(i) = numWrong / numExamples;
    end
    lambdaString = strcat(strcat('weights_lambda_', num2str(lambda)), '_');
    output = strcat(lambdaString, strrep(datestr(clock, 0), ':', '_'));
    save(strcat(output, '.mat'));
end

%% Run testing
testError = zeros(100, 1); % Percent error for each output pixel
data = clean_data_test / 1000;
stimuli = clean_stimuli_train;
stimuli = (stimuli - 0.5) * 2;

numFeatures = length(data(1, :)); %Number of pixels per fMRI reading
numOutputs = length(stimuli(1, :)); %Number of pixels per stimulus
numExamples = length(data(:, 1));

for i = 1:numOutputs
    numWrong = 0;
    w = weights(i, :);
    for j = 1:numExamples
        features = data(j, :);
        score = dot(w, features);
        y = stimuli(j, i);
        if (sign(score) ~= y) %Misclassified
            numWrong = numWrong + 1;
        end
    end
    testError(i) = numWrong / numExamples;
    fprintf('Output pixel: %d, Error: %f\n', i, testError(i));
end

    