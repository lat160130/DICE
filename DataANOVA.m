function [results,means,stats,results1,means1,stats1] = DataANOVA(Serious_Threat_Sex0,Serious_Threat_Sex1)
% Anova Test 1

[p,tbl,stats] = anova1(Serious_Threat_Sex0);
[results,means] = multcompare(stats);
[p1,tbl1,stats1] = anova1(Serious_Threat_Sex1);
[results1,means1] = multcompare(stats);

% check for tukey post hoc


end

% this function is too static - has double inputs, we should serialize with a loop