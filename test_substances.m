clc;
clear;
close all;
alpha = 0.05;

% == 0. Read in substances xlsx sheet =====================================0. R. substances test
filename = 'dice_cov_substances.xlsx';
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
% sex wise/alone wise data is not categorical data, we are looking at
% differences in means between 2 groups --> now check parametric
% -- perform sex/alone tests ----------------------------------------------SA
beer_fem = beer_7days_mm(10,:)';
beer_men = beer_7days_mm(11,:)';
beer_alone    = beer_7days_mm(17,:)';
beer_two_more = beer_7days_mm(18,:)'; 


beer_sex_param_check   = chk_parametric([beer_fem, beer_men], alpha);
beer_alone_param_check = chk_parametric([beer_alone,beer_two_more], alpha);
% row 10 is female, row 11 is male
% not parametric - fails 2nd test - non equal variances

[beer_sex_p, beer_sex_h]     = ranksum(beer_fem, beer_men);
[beer_alone_p, beer_alone_h] = ranksum(beer_alone, beer_two_more);
% -------------------------------------------------------------------------SA
% ========================================================================= beer_7days_mm

% == wine_7days_mm ======================================================== wine_7days_mm
% regression - we have a time series here and want to model it with
% a linear regression see if there is true change
wine_reg = fitlm(wine_7days_mm(1,:), wine_7days_mm(6,:), 'linear');
% wine_reg.Rsquared.adjusted; - R^2 adjusted value
% wine_reg.Coefficients.Estimate(2); - slope value
% plot(wine_reg)
% sex wise/alone wise data is not categorical data, we are looking at
% differences in means between 2 groups --> now check parametric
% -- perform sex/alone tests ----------------------------------------------SA
wine_fem = wine_7days_mm(10,:)';
wine_men = wine_7days_mm(11,:)';
wine_alone    = wine_7days_mm(17,:)';
wine_two_more = wine_7days_mm(18,:)'; 


wine_sex_param_check   = chk_parametric([wine_fem, wine_men], alpha);
wine_alone_param_check = chk_parametric([wine_alone,wine_two_more], alpha);
% row 10 is female, row 11 is male
% not parametric - fails 2nd test - non equal variances

[wine_sex_p, wine_sex_h]     = ranksum(wine_fem, wine_men);
[wine_alone_p, wine_alone_h] = ranksum(wine_alone, wine_two_more);
% -------------------------------------------------------------------------SA
% ========================================================================= wine_7days_mm

% == liquor_7days_mm ======================================================== liquor_7days_mm
% regression - we have a time series here and want to model it with
% a linear regression see if there is true change
liquor_reg = fitlm(liquor_7days_mm(1,:), liquor_7days_mm(6,:), 'linear');
% liquor_reg.Rsquared.adjusted; - R^2 adjusted value
% liquor_reg.Coefficients.Estimate(2); - slope value
% plot(liquor_reg)
% sex wise/alone wise data is not categorical data, we are looking at
% differences in means between 2 groups --> now check parametric
% -- perform sex/alone tests ----------------------------------------------SA
liquor_fem = liquor_7days_mm(10,:)';
liquor_men = liquor_7days_mm(11,:)';
liquor_alone    = liquor_7days_mm(17,:)';
liquor_two_more = liquor_7days_mm(18,:)'; 


liquor_sex_param_check   = chk_parametric([liquor_fem, liquor_men], alpha);
liquor_alone_param_check = chk_parametric([liquor_alone,liquor_two_more], alpha);
% row 10 is female, row 11 is male
% not parametric - fails 2nd test - non equal variances

[liquor_sex_p, liquor_sex_h]     = ranksum(liquor_fem, liquor_men);
[liquor_alone_p, liquor_alone_h] = ranksum(liquor_alone, liquor_two_more);
% -------------------------------------------------------------------------SA
% ========================================================================= liquor_7days_mm

% == coffee_7days_mm ======================================================== coffee_7days_mm
% regression - we have a time series here and want to model it with
% a linear regression see if there is true change
coffee_reg = fitlm(coffee_7days_mm(1,:), coffee_7days_mm(6,:), 'linear');
% coffee_reg.Rsquared.adjusted; - R^2 adjusted value
% coffee_reg.Coefficients.Estimate(2); - slope value
% plot(coffee_reg)
% sex wise/alone wise data is not categorical data, we are looking at
% differences in means between 2 groups --> now check parametric
% -- perform sex/alone tests ----------------------------------------------SA
coffee_fem = coffee_7days_mm(10,:)';
coffee_men = coffee_7days_mm(11,:)';
coffee_alone    = coffee_7days_mm(17,:)';
coffee_two_more = coffee_7days_mm(18,:)'; 


coffee_sex_param_check   = chk_parametric([coffee_fem, coffee_men], alpha);
coffee_alone_param_check = chk_parametric([coffee_alone,coffee_two_more], alpha);
% row 10 is female, row 11 is male
% not parametric - fails 2nd test - non equal variances

[coffee_sex_p, coffee_sex_h]     = ranksum(coffee_fem, coffee_men);
[coffee_alone_p, coffee_alone_h] = ranksum(coffee_alone, coffee_two_more);
% -------------------------------------------------------------------------SA
% ========================================================================= coffee_7days_mm

% == tea_7days_mm ======================================================== tea_7days_mm
% regression - we have a time series here and want to model it with
% a linear regression see if there is true change
tea_reg = fitlm(tea_7days_mm(1,:), tea_7days_mm(6,:), 'linear');
% tea_reg.Rsquared.adjusted; - R^2 adjusted value
% tea_reg.Coefficients.Estimate(2); - slope value
% plot(tea_reg)
% sex wise/alone wise data is not categorical data, we are looking at
% differences in means between 2 groups --> now check parametric
% -- perform sex/alone tests ----------------------------------------------SA
tea_fem = tea_7days_mm(10,:)';
tea_men = tea_7days_mm(11,:)';
tea_alone    = tea_7days_mm(17,:)';
tea_two_more = tea_7days_mm(18,:)'; 


tea_sex_param_check   = chk_parametric([tea_fem, tea_men], alpha);
tea_alone_param_check = chk_parametric([tea_alone,tea_two_more], alpha);
% row 10 is female, row 11 is male
% not parametric - fails 2nd test - non equal variances

[tea_sex_p, tea_sex_h]     = ranksum(tea_fem, tea_men);
[tea_alone_p, tea_alone_h] = ranksum(tea_alone, tea_two_more);
% -------------------------------------------------------------------------SA
% ========================================================================= tea_7days_mm

% == bang_7days_mm ======================================================== bang_7days_mm
% regression - we have a time series here and want to model it with
% a linear regression see if there is true change
bang_reg = fitlm(bang_7days_mm(1,:), bang_7days_mm(6,:), 'linear');
% bang_reg.Rsquared.adjusted; - R^2 adjusted value
% bang_reg.Coefficients.Estimate(2); - slope value
% plot(bang_reg)
% sex wise/alone wise data is not categorical data, we are looking at
% differences in means between 2 groups --> now check parametric
% -- perform sex/alone tests ----------------------------------------------SA
bang_fem = bang_7days_mm(10,:)';
bang_men = bang_7days_mm(11,:)';
bang_alone    = bang_7days_mm(17,:)';
bang_two_more = bang_7days_mm(18,:)'; 


bang_sex_param_check   = chk_parametric([bang_fem, bang_men], alpha);
bang_alone_param_check = chk_parametric([bang_alone,bang_two_more], alpha);
% row 10 is female, row 11 is male
% not parametric - fails 2nd test - non equal variances

[bang_sex_p, bang_sex_h]     = ranksum(bang_fem, bang_men);
[bang_alone_p, bang_alone_h] = ranksum(bang_alone, bang_two_more);
% -------------------------------------------------------------------------SA
% ========================================================================= bang_7days_mm


% % == mod_alc_consump_le_mo ================================================ mod_alc_consump_le_mo
% mod_alc_param_check_sex   = chk_parametric(mod_alc_consump_le_mo(9:14,:)', alpha);
% mod_alc_param_check_alone = chk_parametric(mod_alc_consump_le_mo(19:24,:)', alpha);
% % both parametric
% 
% mod_alc_consump_reg = fitlm(mod_alc_consump_le_mo(1,:), mod_alc_consump_le_mo(2,:)./mod_alc_consump_le_mo(5,:), 'linear');
% 
% [mod_alc_consump_sex_no_p,       mod_alc_consump_sex_no_h]       = ranksum(mod_alc_consump_le_mo(9,:), mod_alc_consump_le_mo(10,:));
% [mod_alc_consump_sex_yes_more_p, mod_alc_consump_sex_yes_more_h] = ranksum(mod_alc_consump_le_mo(11,:), mod_alc_consump_le_mo(12,:));
% [mod_alc_consump_sex_yes_less_p, mod_alc_consump_sex_yes_less_h] = ranksum(mod_alc_consump_le_mo(13,:), mod_alc_consump_le_mo(14,:));
% 
% [mod_alc_consump_alone_no_p,       mod_alc_consump_alone_no_h]       = ranksum(mod_alc_consump_le_mo(19,:), mod_alc_consump_le_mo(20,:));
% [mod_alc_consump_alone_yes_more_p, mod_alc_consump_alone_yes_more_h] = ranksum(mod_alc_consump_le_mo(21,:), mod_alc_consump_le_mo(22,:));
% [mod_alc_consump_alone_yes_less_p, mod_alc_consump_alone_yes_less_h] = ranksum(mod_alc_consump_le_mo(23,:), mod_alc_consump_le_mo(24,:));
% % ========================================================================= mod_alc_consump_le_mo
% 
% % == mod_stim_consump_le_mo =============================================== mod_stim_consump_le_mo
% 
% mod_stim_sex_param_check   = chk_parametric(mod_stim_consump_le_mo(9:14,:)',alpha);
% mod_stim_alone_param_check = chk_parametric(mod_stim_consump_le_mo(19:24,:)',alpha);
% % % all are non parametric
% 
% mod_stim_reg = fitlm(mod_stim_consump_le_mo(1,:), mod_stim_consump_le_mo(2,:)./mod_stim_consump_le_mo(5,:), 'linear');
% 
% [mod_stim_consump_sex_no_p,       mod_stim_consump_sex_no_h]       = ranksum(mod_stim_consump_le_mo(9,:),  mod_stim_consump_le_mo(10,:));
% [mod_stim_consump_sex_yes_more_p, mod_stim_consump_sex_yes_more_h] = ranksum(mod_stim_consump_le_mo(11,:), mod_stim_consump_le_mo(12,:));
% [mod_stim_consump_sex_yes_less_p, mod_stim_consump_sex_yes_less_h] = ranksum(mod_stim_consump_le_mo(13,:), mod_stim_consump_le_mo(14,:));
% 
% [mod_stim_consump_alone_no_p,       mod_stim_consump_alone_no_h]       = ranksum(mod_stim_consump_le_mo(19,:), mod_stim_consump_le_mo(20,:));
% [mod_stim_consump_alone_yes_more_p, mod_stim_consump_alone_yes_more_h] = ranksum(mod_stim_consump_le_mo(21,:), mod_stim_consump_le_mo(22,:));
% [mod_stim_consump_alone_yes_less_p, mod_stim_consump_alone_yes_less_h] = ranksum(mod_stim_consump_le_mo(23,:), mod_stim_consump_le_mo(24,:));
% % ========================================================================= mod_stim_consump_le_mo


% == Build Output matrix with results ===================================== Output with Results
r2    =  [beer_reg.Rsquared.Ordinary;   wine_reg.Rsquared.Ordinary; liquor_reg.Rsquared.Ordinary; ...
          coffee_reg.Rsquared.Ordinary; tea_reg.Rsquared.Ordinary;  bang_reg.Rsquared.Ordinary];
      
slope = [beer_reg.Coefficients.Estimate(2);   wine_reg.Coefficients.Estimate(2); liquor_reg.Coefficients.Estimate(2); ...
          coffee_reg.Coefficients.Estimate(2); tea_reg.Coefficients.Estimate(2);  bang_reg.Coefficients.Estimate(2)];

name  = {'beer_7days_mm';   'wine_7days_mm'; 'liquor_7days_mm'; ...
         'coffee_7days_mm'; 'tea_7days_mm';  'bang_7days_mm'};

substances_sex   = [beer_sex_p, beer_sex_h;     wine_sex_p, wine_sex_h; liquor_sex_p, liquor_sex_h; ...
                    coffee_sex_p, coffee_sex_h; tea_sex_p, tea_sex_h;   bang_sex_p, bang_sex_h];
                
substances_alone = [beer_alone_p, beer_alone_h;     wine_alone_p, wine_alone_h; liquor_alone_p, liquor_alone_h; ...
                    coffee_alone_p, coffee_alone_h; tea_alone_p, tea_alone_h;   bang_alone_p, bang_alone_h];

TABLE_substances_lreg = table(name, r2, slope);
TABLE_substances_sex_alone = table(name, substances_sex, substances_alone);

% writetable(T,filename,'Sheet',1,'Range','D1')
fileout = 'substances.xlsx';
writetable(TABLE_substances_lreg, fileout, 'Sheet', 'lreg');
writetable(TABLE_substances_sex_alone, fileout, 'Sheet', 'sex_alone');

% ========================================================================= Output with Results
