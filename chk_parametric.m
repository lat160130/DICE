function [is_parametric_mat] = chk_parametric(data, alpha)
% == Goal ================================================================= Goal
% Take in n >= 1 data sets and check the parametric assumptions.
% ========================================================================= Goal

% == Input Validation ===================================================== Input Validation

if alpha <= 0 || alpha >= 1
    error('Your alpha is less than or equal to zero, or greater than or equal to one.');
end % if alpha <= 0 || alpha >= 1

if sum(isnan(data), 'all') > 0
    error('There are NaNs in your matrix.');
end % if sum(isnan(data), 'all') > 0

if size(data,1) < 20
    warning('A Shapiro Wilk test is used here to check for normality. You have less than 20 data points. Proceed with extreme caution.');
end % if size(data,1) < 20

if size(data,1) < 5
    error('A Shapiro Wilk test is used here to check for normality. You have less than 5 data points. Do not Proceed.');
end % if size(data,1) < 5

% ========================================================================= Input Validation

% == Input Variables ====================================================== Input Variable
% data - read in a matrix.  Each column MUST be an independent dataset.
% 0 entry in the matrix means the condition was met.  
% 1 means the condition was not met.
% alpha - scalar
% ========================================================================= Input Variable

% == Output Matrix ======================================================== Output Matrix
% This function returns a matrix.  It will say return which conditions
% were violated for each input matrix. 
% ========================================================================= Output Matrix

% == Setup ================================================================ Setup
% Rows are the assumption, columns are the index of the matrix entered.
% E.g.,  check_parametric(matrix_data):
% Column one has the assumption results for the first column of matrix_data.
numcol = size(data,2);
% alpha = .05; % - our standard alpha

is_parametric_mat = -1*ones(4, numcol); % returns 4 rows and n columns.

% ========================================================================= Setup

% == 1. Check Normality =================================================== 1. Normality
% This uses the Shapiro-Wilk test to check for normality. Credit to: 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                Copyright (c) 17 March 2009 by Ahmed Ben Saïda          %
%                 Department of Finance, IHEC Sousse - Tunisia           %
%                       Email: ahmedbensaida@yahoo.com                   %
%                    $ Revision 3.0 $ Date: 18 Juin 2014 $               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for use of swtest.m.

for i = 1:numcol
    [H, ~, ~] = swtest(data(:,i), alpha);
    % H = 0 - H is normal, H = 1, H is (probably) not normal.
    is_parametric_mat(1,i) = H;
    
end % for i = 1:numcol
% ========================================================================= 1. Normality


% == 2. Equal Variance ==================================================== 2. Equal Variance
vec_VAR = var(data);
if max(vec_VAR) / min(vec_VAR) < 4 % condition met - equal variances
    is_parametric_mat(2,:) = 0;
elseif max(vec_VAR) / min(vec_VAR) < 0
    error("Negative value detected!?");
else % max(vec_VAR) / min(vec_VAR) > 4
    is_parametric_mat(2,:) = 1; % variances not equal
end

% disp(vec_VAR);
% disp(max(vec_VAR) / min(vec_VAR));


% ========================================================================= 2. Equal Variance

% == 3. Independence ====================================================== 3. Independence
% Assume that the test was independent.
warning('This test is apriori assuming independence.');
is_parametric_mat(3,:) = 0;
% ========================================================================= 3. Independence

% == 4. Outlier Detection ================================================= 4. Detect Outliers
for j = 1:numcol
TF = isoutlier(data(:,j), 'grubbs');
    if sum(TF) > 0
         is_parametric_mat(4,j) = 1;
    elseif sum(TF) == 0
        is_parametric_mat(4,j) = 0;
    else % sum(TF) < 0
        error("Sum cannot be less than zero.  GIGO?");
    end % sum(TF) >, =, < 0

end % for j = 1:numcol
% ========================================================================= 4. Detect Outliers
end

