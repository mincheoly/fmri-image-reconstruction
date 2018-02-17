function [ lambdas ] = find_lambdas( A, B, C, D, labels )
%FIND_LAMBDAS 
%    
% Let n be the number of training examples
% A is 100-by-n  (1x1)
% B is 90-by-n   (1x2)
% C is 90-by-n   (2x1)
% D is 81-by-n   (2x2)
% labels is 100-by-n

lambdas = cell(100,1);
for i = 1:100
    if i == 1
        lambdas{1} = [A(1,:)' B(1,:)' C(1,:)' D(1,:)']\(labels(1,:)');    
    elseif i == 10
        lambdas{10} = [A(10,:)' B(9,:)' C(10,:)' D(9,:)']\(labels(10,:)');   
    elseif i == 91
        lambdas{91} = [A(91,:)' B(82,:)' C(81,:)' D(73,:)']\(labels(91,:)');   
    elseif i == 100
        lambdas{100} = [A(100,:)' B(90,:)' C(90,:)' D(81,:)']\(labels(100,:)');   
    elseif sum(ismember(i,[2 3 4 5 6 7 8 9])) 
        lambdas{i} = [A(i,:)' B(i-1,:)' B(i,:)' C(i,:)' D(i-1,:)' D(i,:)']\(labels(i,:)');   
    elseif sum(ismember(i,[11 21 31 41 51 61 71 81])) 
        lambdas{i} = [A(i,:)' B(i-floor(i/10),:)' C(i-10,:)' C(i,:)' D(i-floor(i/10)-9,:)' D(i-floor(i/10),:)']\(labels(i,:)');
    elseif sum(ismember(i,[20 30 40 50 60 70 80 90]))
        lambdas{i} = [A(i,:)' B(i-floor(i/10)-1,:)' C(i-10,:)' C(i,:)' D(i-floor(i/10)-10,:)' D(i-floor(i/10)-1,:)']\(labels(i,:)');
    elseif sum(ismember(i,[92 93 94 95 96 97 98 99])) 
        lambdas{i} = [A(i,:)' B(i-floor(i/10)-1,:)' B(i-floor(i/10),:)' C(i-10,:)' D(i-floor(i/10)-10,:)' D(i-floor(i/10)-9,:)']\(labels(i,:)');
    else lambdas{i} = [A(i,:)' B(i-floor(i/10)-1,:)' B(i-floor(i/10),:)' C(i-10,:)' C(i,:)'  D(i-floor(i/10)-10,:)' D(i-floor(i/10)-9,:)' D(i-floor(i/10)-1,:)' D(i-floor(i/10),:)']\(labels(i,:)');
    end
end

