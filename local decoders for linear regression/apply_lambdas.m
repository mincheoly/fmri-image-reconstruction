function [ recon ] = apply_lambdas( A, B, C, D, lambdas )
%APPLY_LAMBDAS 
%    
% Let n be the number of test examples
% A is 100-by-n  (1x1)
% B is 90-by-n   (1x2)
% C is 90-by-n   (2x1)
% D is 81-by-n   (2x2)
% lambdas is a 100-by-1 cell array

recon = zeros(size(A));
for i = 1:100
    if i == 1
        recon(i,:) = ([A(1,:)' B(1,:)' C(1,:)' D(1,:)']*lambdas{i})';    
    elseif i == 10
        recon(i,:) = ([A(10,:)' B(9,:)' C(10,:)' D(9,:)']*lambdas{i})';   
    elseif i == 91
        recon(i,:) = ([A(91,:)' B(82,:)' C(81,:)' D(73,:)']*lambdas{i})';   
    elseif i == 100
        recon(i,:) = ([A(100,:)' B(90,:)' C(90,:)' D(81,:)']*lambdas{i})';   
    elseif sum(ismember(i,[2 3 4 5 6 7 8 9])) 
        recon(i,:) = ([A(i,:)' B(i-1,:)' B(i,:)' C(i,:)' D(i-1,:)' D(i,:)']*lambdas{i})'; 
    elseif sum(ismember(i,[11 21 31 41 51 61 71 81])) 
        recon(i,:) = ([A(i,:)' B(i-floor(i/10),:)' C(i-10,:)' C(i,:)' D(i-floor(i/10)-9,:)' D(i-floor(i/10),:)']*lambdas{i})';
    elseif sum(ismember(i,[20 30 40 50 60 70 80 90]))
        recon(i,:) = ([A(i,:)' B(i-floor(i/10)-1,:)' C(i-10,:)' C(i,:)' D(i-floor(i/10)-10,:)' D(i-floor(i/10)-1,:)']*lambdas{i})';
    elseif sum(ismember(i,[92 93 94 95 96 97 98 99])) 
        recon(i,:) = ([A(i,:)' B(i-floor(i/10)-1,:)' B(i-floor(i/10),:)' C(i-10,:)' D(i-floor(i/10)-10,:)' D(i-floor(i/10)-9,:)']*lambdas{i})';
    else recon(i,:) = ([A(i,:)' B(i-floor(i/10)-1,:)' B(i-floor(i/10),:)' C(i-10,:)' C(i,:)'  D(i-floor(i/10)-10,:)' D(i-floor(i/10)-9,:)' D(i-floor(i/10)-1,:)' D(i-floor(i/10),:)']*lambdas{i})';
    end
end
