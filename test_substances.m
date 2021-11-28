clc;
clear;
close all;

% == 0. Read in substances xlsx sheet =====================================0. R. substances test
filename = 'dice_cov_substances.xlsx';
% % sheetnames = {'wine_7days_mm'};
% % disp(sheetnames(1));
% mat = readmatrix(filename, 'Sheet', 'beer_7days_mm', 'Range', 'B3:L7');
% mat2 = readmatrix(filename);
% mat3 = readmatrix(filename, 'Sheet', 'beer_7days_mm');
% %disp(mat);
% disp(mat2);
% disp(mat3);
% =========================================================================0. R. substances test

% NOTE - ALL DIVISIONS BY ZERO --> 0 BECAUSE NO SUBJECTS WERE IN THAT ROUND
% so those means become (clearly) zero

% == MM Read in =========================================================== MM read
beer_7days_mm   = readmatrix(filename, 'Sheet', 'beer_7days_mm');
wine_7days_mm   = readmatrix(filename, 'Sheet', 'wine_7days_mm');
liquor_7days_mm = readmatrix(filename, 'Sheet', 'liquor_7days_mm');
coffee_7days_mm = readmatrix(filename, 'Sheet', 'coffee_7days_mm');
tea_7days_mm    = readmatrix(filename, 'Sheet', 'tea_7days_mm');
bang_7days_mm   = readmatrix(filename, 'Sheet', 'bang_7days_mm');
% ========================================================================= MM read


% == Less/More Read in ====================================================Less/More read
mod_alc_consump_le_mo = readmatrix(filename, 'Sheet', 'mod_alc_consump_le_mo');
mod_stim_consump_le_mo = readmatrix(filename, 'Sheet', 'mod_stim_consump_le_mo');
% =========================================================================Less/More read

% == beer_7days_mm ======================================================== beer_7days_mm
% regression - we have a time series here and want to model it with
% a linear regression see if there is true change
beer_reg = fitlm(beer_7days_mm(1,:), beer_7days_mm(6,:), 'linear');
% beer_reg.Rsquared.adjusted; - R^2 adjusted value
% beer_reg.Coefficients.Estimate(2); - slope value
% plot(beer_reg)

% 


% ========================================================================= beer_7days_mm




