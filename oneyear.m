clear;
close all;
clc;

% == 0. Read in fitness xlsx sheet ========================================0. R fitness test
filename = 'beer_over_time.xlsx';
alpha = 0.05;
beer_time = readmatrix(filename);
% =========================================================================0. R. fitness test
beer_param = chk_parametric(beer_time, alpha)


p = kruskalwallis(beer_param)