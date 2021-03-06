clc;
clear;
close all;



% == 0. Read in fitness xlsx sheet ========================================0. R fitness test
filename = 'dice_cov_fitness.xlsx';
alpha = 0.05;
% =========================================================================0. R. fitness test

% == NY Read in =========================================================== NY
pos_impact_week_ny     = readmatrix(filename, 'Sheet', 'pos_impact_week_ny');
last7_newactivities_ny = readmatrix(filename, 'Sheet', 'last7_newactivities_ny');
influ_exer_ny          = readmatrix(filename, 'Sheet', 'influ_exer_ny');
% ========================================================================= NY

% == MM Read in =========================================================== MM
vigpa_7days_mm   = readmatrix(filename, 'Sheet', 'vigpa_7days_mm');
time_vpa_mm      = readmatrix(filename, 'Sheet', 'time_vpa_mm');
modpa_7days_mm   = readmatrix(filename, 'Sheet', 'modpa_7days_mm');
time_mpa_mm      = readmatrix(filename, 'Sheet', 'time_mpa_mm');
walk_7days_mm    = readmatrix(filename, 'Sheet', 'walk_7days_mm');
time_walk_mm     = readmatrix(filename, 'Sheet', 'time_walk_mm');
sitting_7days_mm = readmatrix(filename, 'Sheet', 'sitting_7days_mm');
% ========================================================================= MM

% == vigpa_7days_mm ======================================================== vigpa_7days_mm
% regression - we have a time series here and want to model it with
% a linear regression see if there is true change
vigpa_reg = fitlm(vigpa_7days_mm(1,:), vigpa_7days_mm(6,:), 'linear');
% vigpa_reg.Rsquared.adjusted; - R^2 adjusted value
% vigpa_reg.Coefficients.Estimate(2); - slope value
% plot(vigpa_reg)
% sex wise/alone wise data is not categorical data, we are looking at
% differences in means between 2 groups --> now check parametric
% -- perform sex/alone tests ----------------------------------------------SA
vigpa_fem = vigpa_7days_mm(10,:)';
vigpa_men = vigpa_7days_mm(11,:)';
vigpa_alone    = vigpa_7days_mm(17,:)';
vigpa_two_more = vigpa_7days_mm(18,:)'; 


vigpa_sex_param_check   = chk_parametric([vigpa_fem, vigpa_men], alpha);
vigpa_alone_param_check = chk_parametric([vigpa_alone,vigpa_two_more], alpha);
% row 10 is female, row 11 is male
% not parametric - fails 2nd test - non equal variances

[vigpa_sex_p, vigpa_sex_h]     = ranksum(vigpa_fem, vigpa_men);
[vigpa_alone_p, vigpa_alone_h] = ranksum(vigpa_alone, vigpa_two_more);
% -------------------------------------------------------------------------SA
% ========================================================================= vigpa_7days_mm

% == time_vpa_mm ========================================================== time_vpa_mm
% regression - we have a time series here and want to model it with
% a linear regression see if there is true change
time_vpa_reg = fitlm(time_vpa_mm(1,:), time_vpa_mm(6,:), 'linear');
% time_vpa_mm.Rsquared.adjusted; - R^2 adjusted value
% time_vpa_mm.Coefficients.Estimate(2); - slope value
% plot(time_vpa_mm)
% sex wise/alone wise data is not categorical data, we are looking at
% differences in means between 2 groups --> now check parametric
% -- perform sex/alone tests ----------------------------------------------SA
time_vpa_fem = time_vpa_mm(10,:)';
time_vpa_men = time_vpa_mm(11,:)';
time_vpa_alone    = time_vpa_mm(17,:)';
time_vpa_two_more = time_vpa_mm(18,:)'; 


time_vpa_sex_param_check   = chk_parametric([time_vpa_fem, time_vpa_men], alpha);
time_vpa_alone_param_check = chk_parametric([time_vpa_alone,time_vpa_two_more], alpha);
% row 10 is female, row 11 is male
% not parametric - fails 2nd test - non equal variances

[time_vpa_sex_p, time_vpa_sex_h]     = ranksum(time_vpa_fem, time_vpa_men);
[time_vpa_alone_p, time_vpa_alone_h] = ranksum(time_vpa_alone, time_vpa_two_more);
% -------------------------------------------------------------------------SA
% ========================================================================= time_vpa_mm

% == modpa_7days_mm ======================================================== modpa_7days_mm
% regression - we have a time series here and want to model it with
% a linear regression see if there is true change
modpa_reg = fitlm(modpa_7days_mm(1,:), modpa_7days_mm(6,:), 'linear');
% modpa_reg.Rsquared.adjusted; - R^2 adjusted value
% modpa_reg.Coefficients.Estimate(2); - slope value
% plot(modpa_reg)
% sex wise/alone wise data is not categorical data, we are looking at
% differences in means between 2 groups --> now check parametric
% -- perform sex/alone tests ----------------------------------------------SA
modpa_fem = modpa_7days_mm(10,:)';
modpa_men = modpa_7days_mm(11,:)';
modpa_alone    = modpa_7days_mm(17,:)';
modpa_two_more = modpa_7days_mm(18,:)'; 


modpa_sex_param_check   = chk_parametric([modpa_fem, modpa_men], alpha);
modpa_alone_param_check = chk_parametric([modpa_alone,modpa_two_more], alpha);
% row 10 is female, row 11 is male
% not parametric - fails 2nd test - non equal variances

[modpa_sex_p, modpa_sex_h]     = ranksum(modpa_fem, modpa_men);
[modpa_alone_p, modpa_alone_h] = ranksum(modpa_alone, modpa_two_more);
% -------------------------------------------------------------------------SA
% ========================================================================= modpa_7days_mm


% == time_mpa_mm ========================================================== time_mpa_mm
% regression - we have a time series here and want to model it with
% a linear regression see if there is true change
time_mpa_reg = fitlm(time_mpa_mm(1,:), time_mpa_mm(6,:), 'linear');
% time_mpa_mm.Rsquared.adjusted; - R^2 adjusted value
% time_mpa_mm.Coefficients.Estimate(2); - slope value
% plot(time_mpa_mm)
% sex wise/alone wise data is not categorical data, we are looking at
% differences in means between 2 groups --> now check parametric
% -- perform sex/alone tests ----------------------------------------------SA
time_mpa_fem = time_mpa_mm(10,:)';
time_mpa_men = time_mpa_mm(11,:)';
time_mpa_alone    = time_mpa_mm(17,:)';
time_mpa_two_more = time_mpa_mm(18,:)'; 


time_mpa_sex_param_check   = chk_parametric([time_mpa_fem, time_mpa_men], alpha);
time_mpa_alone_param_check = chk_parametric([time_mpa_alone,time_mpa_two_more], alpha);
% row 10 is female, row 11 is male
% not parametric - fails 2nd test - non equal variances

[time_mpa_sex_p, time_mpa_sex_h]     = ranksum(time_mpa_fem, time_mpa_men);
[time_mpa_alone_p, time_mpa_alone_h] = ranksum(time_mpa_alone, time_mpa_two_more);
% -------------------------------------------------------------------------SA
% ========================================================================= time_mpa_mm


% == walk_7days_mm ======================================================== walk_7days_mm
% regression - we have a time series here and want to model it with
% a linear regression see if there is true change
walk_reg = fitlm(walk_7days_mm(1,:), walk_7days_mm(6,:), 'linear');
% walk_reg.Rsquared.adjusted; - R^2 adjusted value
% walk_reg.Coefficients.Estimate(2); - slope value
% plot(walk_reg)
% sex wise/alone wise data is not categorical data, we are looking at
% differences in means between 2 groups --> now check parametric
% -- perform sex/alone tests ----------------------------------------------SA
walk_fem = walk_7days_mm(10,:)';
walk_men = walk_7days_mm(11,:)';
walk_alone    = walk_7days_mm(17,:)';
walk_two_more = walk_7days_mm(18,:)'; 


walk_sex_param_check   = chk_parametric([walk_fem, walk_men], alpha);
walk_alone_param_check = chk_parametric([walk_alone,walk_two_more], alpha);
% row 10 is female, row 11 is male
% not parametric - fails 2nd test - non equal variances

[walk_sex_p, walk_sex_h]     = ranksum(walk_fem, walk_men);
[walk_alone_p, walk_alone_h] = ranksum(walk_alone, walk_two_more);
% -------------------------------------------------------------------------SA
% ========================================================================= walk_7days_mm

% == time_walk_mm ========================================================== time_walk_mm
% regression - we have a time series here and want to model it with
% a linear regression see if there is true change
time_walk_reg = fitlm(time_walk_mm(1,:), time_walk_mm(6,:), 'linear');
% time_walk_mm.Rsquared.adjusted; - R^2 adjusted value
% time_walk_mm.Coefficients.Estimate(2); - slope value
% plot(time_walk_mm)
% sex wise/alone wise data is not categorical data, we are looking at
% differences in means between 2 groups --> now check parametric
% -- perform sex/alone tests ----------------------------------------------SA
time_walk_fem = time_walk_mm(10,:)';
time_walk_men = time_walk_mm(11,:)';
time_walk_alone    = time_walk_mm(17,:)';
time_walk_two_more = time_walk_mm(18,:)'; 


time_walk_sex_param_check   = chk_parametric([time_walk_fem, time_walk_men], alpha);
time_walk_alone_param_check = chk_parametric([time_walk_alone,time_walk_two_more], alpha);
% row 10 is female, row 11 is male
% not parametric - fails 2nd test - non equal variances

[time_walk_sex_p, time_walk_sex_h]     = ranksum(time_walk_fem, time_walk_men);
[time_walk_alone_p, time_walk_alone_h] = ranksum(time_walk_alone, time_walk_two_more);
% -------------------------------------------------------------------------SA
% ========================================================================= time_walk_mm

% == sitting_7days_mm ======================================================== sitting_7days_mm
% regression - we have a time series here and want to model it with
% a linear regression see if there is true change
sitting_reg = fitlm(sitting_7days_mm(1,:), sitting_7days_mm(6,:), 'linear');
% sitting_reg.Rsquared.adjusted; - R^2 adjusted value
% sitting_reg.Coefficients.Estimate(2); - slope value
% plot(sitting_reg)
% sex wise/alone wise data is not categorical data, we are looking at
% differences in means between 2 groups --> now check parametric
% -- perform sex/alone tests ----------------------------------------------SA
sitting_fem = sitting_7days_mm(10,:)';
sitting_men = sitting_7days_mm(11,:)';
sitting_alone    = sitting_7days_mm(17,:)';
sitting_two_more = sitting_7days_mm(18,:)'; 


sitting_sex_param_check   = chk_parametric([sitting_fem, sitting_men], alpha);
sitting_alone_param_check = chk_parametric([sitting_alone,sitting_two_more], alpha);
% row 10 is female, row 11 is male
% not parametric - fails 2nd test - non equal variances

[sitting_sex_p, sitting_sex_h]     = ranksum(sitting_fem, sitting_men);
[sitting_alone_p, sitting_alone_h] = ranksum(sitting_alone, sitting_two_more);
% -------------------------------------------------------------------------SA
% ========================================================================= sitting_7days_mm

% == pos_impact_week_ny =================================================== pos_impact_week_ny

pos_impact_reg = fitlm(pos_impact_week_ny(4,:), pos_impact_week_ny(1,:)./pos_impact_week_ny(3,:), 'linear');
pos_impact_sex_param_check = chk_parametric([pos_impact_week_ny(8:11,:)', pos_impact_week_ny(15:18,:)'], alpha);
% all non parametric

pos_impact_sex_no  = ranksum(pos_impact_week_ny(8,:),pos_impact_week_ny(9,:));
pos_impact_sex_yes = ranksum(pos_impact_week_ny(10,:), pos_impact_week_ny(11,:));

pos_impact_alone_no  = ranksum(pos_impact_week_ny(15,:), pos_impact_week_ny(16,:));
pos_impact_alone_yes = ranksum(pos_impact_week_ny(17,:), pos_impact_week_ny(18,:));
% ========================================================================= pos_impact_week_ny


% == last7_newactivities_ny =================================================== last7_newactivities_ny

last7_reg = fitlm(last7_newactivities_ny(4,:), last7_newactivities_ny(1,:)./last7_newactivities_ny(3,:), 'linear');
last7_param_check = chk_parametric([last7_newactivities_ny(8:11,:)', last7_newactivities_ny(15:18,:)'], alpha);
% all non parametric

last7_sex_no  = ranksum(last7_newactivities_ny(8,:),last7_newactivities_ny(9,:));
last7_sex_yes = ranksum(last7_newactivities_ny(10,:), last7_newactivities_ny(11,:));

last7_alone_no  = ranksum(last7_newactivities_ny(15,:), last7_newactivities_ny(16,:));
last7_alone_yes = ranksum(last7_newactivities_ny(17,:), last7_newactivities_ny(18,:));
% ========================================================================= last7_newactivities_ny

% == influ_exer_ny ======================================================== influ_exer_ny
% influ_exer
influ_exer_reg = fitlm(influ_exer_ny(4,:), influ_exer_ny(1,:)./influ_exer_ny(3,:), 'linear');
influ_exer_param_check = chk_parametric([influ_exer_ny(8:11,:)', influ_exer_ny(15:18,:)'], alpha);
% all non parametric

influ_exer_sex_no  = ranksum(influ_exer_ny(8,:),influ_exer_ny(9,:));
influ_exer_sex_yes = ranksum(influ_exer_ny(10,:), influ_exer_ny(11,:));

influ_exer_alone_no  = ranksum(influ_exer_ny(15,:), influ_exer_ny(16,:));
influ_exer_alone_yes = ranksum(influ_exer_ny(17,:), influ_exer_ny(18,:));
% ========================================================================= influ_exer_ny

% == Build Output Matrix w/ Results ======================================= Results

% Create R^2 table, we want R2 results and slope


r2 = [vigpa_reg.Rsquared.Ordinary;   time_vpa_reg.Rsquared.Ordinary; modpa_reg.Rsquared.Ordinary; ...
      walk_reg.Rsquared.Ordinary;    time_mpa_reg.Rsquared.Ordinary; time_walk_reg.Rsquared.Ordinary; ...
      sitting_reg.Rsquared.Ordinary;];
  % column 1 is the R^2 value, and column 2 is the slope
  
slope = [vigpa_reg.Coefficients.Estimate(2); time_vpa_reg.Coefficients.Estimate(2); modpa_reg.Coefficients.Estimate(2); ...
         walk_reg.Coefficients.Estimate(2);     time_mpa_reg.Coefficients.Estimate(2); time_walk_reg.Coefficients.Estimate(2); ...
         sitting_reg.Coefficients.Estimate(2);];
     
name_reg = {'vigpa_7days_mm'; 'time_vpa_mm'; 'modpa_7days_mm'; 'time_mpa_mm'; ...
        'walk_7days_mm'; 'time_walk_mm'; 'sitting_7days_mm';};

TABLE_fitness_lreg = table(name_reg, r2, slope);

% Create table with p, h results for sex and alone

fitness_sex   = [vigpa_sex_p, vigpa_sex_h;       time_vpa_sex_p, time_vpa_sex_h;  modpa_sex_p, modpa_sex_h; ...
                 time_mpa_sex_p, time_mpa_sex_h; walk_sex_p, walk_sex_h;          time_walk_sex_p, time_walk_sex_h;
                 sitting_sex_p, sitting_sex_h;];
                 
fitness_alone = [vigpa_alone_p, vigpa_alone_h;       time_vpa_alone_p, time_vpa_alone_h; modpa_alone_p, modpa_alone_h; ...
                 time_mpa_alone_p, time_mpa_alone_h; walk_alone_p, walk_alone_h;         time_walk_alone_p, time_walk_alone_h; ...
                 sitting_alone_p, sitting_alone_h;];
TABLE_fitness_sex_alone = table(name_reg, fitness_sex, fitness_alone);

% writetable(T,filename,'Sheet',1,'Range','D1')
% fileout = 'fitness.xlsx';
% writetable(TABLE_fitness_lreg, fileout, 'Sheet', 'lreg');
% writetable(TABLE_fitness_sex_alone, fileout, 'Sheet', 'sex_alone');

                 
% ========================================================================= Results

% -- Extra ---------------------------------------------------------------- Extra
% r2 = [vigpa_reg.Rsquared.Ordinary;   time_vpa_reg.Rsquared.Ordinary; modpa_reg.Rsquared.Ordinary; ...
%       walk_reg.Rsquared.Ordinary;    time_mpa_reg.Rsquared.Ordinary; time_walk_reg.Rsquared.Ordinary; ...
%       sitting_reg.Rsquared.Ordinary; pos_impact_reg.Rsquared.Ordinary; last7_reg.Rsquared.Ordinary; influ_exer_reg.Rsquared.Ordinary];
%   % column 1 is the R^2 value, and column 2 is the slope
%   
% slope = [vigpa_reg.Coefficients.Estimate(2); time_vpa_reg.Coefficients.Estimate(2); modpa_reg.Coefficients.Estimate(2); ...
%          walk_reg.Coefficients.Estimate(2);     time_mpa_reg.Coefficients.Estimate(2); time_walk_reg.Coefficients.Estimate(2); ...
%          sitting_reg.Coefficients.Estimate(2); pos_impact_reg.Coefficients.Estimate(2); last7_reg.Coefficients.Estimate(2); influ_exer_reg.Coefficients.Estimate(2)];
%      
% name_reg = {'vigpa_7days_mm'; 'time_vpa_mm'; 'modpa_7days_mm'; 'time_mpa_mm'; ...
%         'walk_7days_mm'; 'time_walk_mm'; 'sitting_7days_mm'; 'pos_impact_week_ny';...
%         'last7_newactivities_ny'; 'influ_exer_ny' };
% ------------------------------------------------------------------------- Extra

