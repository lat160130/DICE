% Input Data 
Serious_Threat_Sex1 = Serious_Threat_Sex1;
Serious_Threat_Sex0 = Serious_Threat_Sex0;

% Constants
 T = [0;1;2;6;12;18;24;30;36;42;48];
 L = length(Serious_Threat_Sex1);
 S = 1;
 Data1 = zeros(11,2);
 
for i = 1:length(T)
    
  Col = Serious_Threat_Sex1(:,i);
  Data1(S:L,1) = T(i);
  Data1(S:L,2)= Col; 
  S = S + 48;
  L = L + 48;  
  
end 

 L0 = length(Serious_Threat_Sex0);
 S0 = 1;
 Data0 = zeros(11,2);
for i = 1:length(T)
    
  Col0 = Serious_Threat_Sex0(:,i);
  Data0(S0:L0,1) = T(i);
  Data0(S0:L0,2)= Col0;
  S0 = S0 + 34;
  L0 = L0 + 34; 
  
end 

% Output Data individual columns Data variable carries both paired
x = Data1(:,1)
y = Data1(:,2)
x1 = Data0(:,1);
y1 = Data0(:,2);


