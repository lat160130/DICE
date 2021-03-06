clc;
clear;
close all;

% == 0. Read in fitness xlsx sheet ========================================0. R fitness test
filename = 'total_fitness.xlsx';
alpha = 0.05;
% =========================================================================0. R. fitness test

total_fitness = readmatrix(filename);
total_fitness(:,1) = []; % drop first column of NaNs

tf_param_sex   = chk_parametric(total_fitness(2:5, :)', alpha) 
tf_param_alone = chk_parametric(total_fitness(9:12,  :)', alpha)
%parametric passed

[tf_sex_mean_h, tf_sex_mean_p] = ttest2(total_fitness(2, :), total_fitness(3, :))
[tf_sex_medi_h, tf_sex_medi_p] = ttest2(total_fitness(4, :), total_fitness(5, :))
 
[tf_alone_mean_h, tf_alone_mean_p] = ttest2(total_fitness(9, :), total_fitness(10, :))
[tf_alone_medi_h, tf_alone_medi_p] = ttest2(total_fitness(11, :), total_fitness(12, :))


name = {'Total Fitness: mean & sex';   'Total Fitness: median & sex'; ...
        'Total Fitness: mean & alone'; 'Total Fitness: median & alone'};
results = [tf_sex_mean_h,   tf_sex_mean_p;   tf_sex_medi_h,   tf_sex_medi_p; ...
           tf_alone_mean_h, tf_alone_mean_p; tf_alone_medi_h, tf_alone_medi_p];
       
 t = table(name, results);
 
fileout = 'tf.xlsx';
writetable(t, fileout, 'Sheet', 'tf');