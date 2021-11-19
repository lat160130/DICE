clc;
clear;
close all;

xlsx_name = 'COVID_Questions_Plots_Sex_and_Lone.xlsx';
Serious_Threat = readmatrix(xlsx_name,'Sheet','Serious Threat','Range','B2:L84');

Serious_Threat_Sex0 = readmatrix(xlsx_name,'Sheet','Serious Threat Sex','Range','C2:M35');
Serious_Threat_Sex1 = readmatrix(xlsx_name,'Sheet','Serious Threat Sex','Range','Q2:AA49');

size_ST_Sex0 = size(Serious_Threat_Sex0);
rows = size_ST_Sex0(1);
cols = size_ST_Sex0(2);

list_Serious_Threat_Sex0 = [];
i = 1;
j = 1;
while i < rows+1
    j = 1;
  while j <  cols+1
      list_Serious_Threat_Sex0 = [list_Serious_Threat_Sex0, Serious_Threat_Sex0(i, j)];
      % disp(size(list_Serious_Threat_Sex0));
      j= j+1;
  end
  i= i+1;
end

% 
list_Serious_Threat_Sex0 = list_Serious_Threat_Sex0(~isnan(list_Serious_Threat_Sex0));


% [results,means,stats,results1,means1,stats1] = DataANOVA(Serious_Threat_Sex0,Serious_Threat_Sex1);