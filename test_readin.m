clc;
clear;
close all;

xlsx_name = 'dice_cov_stim_fitness_sex_alone.xlsx';
User_Que_MAT_dot = readmatrix(xlsx_name,'Sheet','User and Question Over Time - S','Range','B2:L84');
[numbers, strings, raw] = xlsread(xlsx_name,'User and Question Over Time - S');

