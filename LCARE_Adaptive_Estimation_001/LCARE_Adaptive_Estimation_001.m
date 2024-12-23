
clear all; clc;

data   = load('DataIndices.dat');    
r_DAX  = diff(log(data(:, 1)));     
r_FTSE = diff(log(data(:, 2)));    
r_SP   = diff(log(data(:, 3)));      
n      = length(data) - 1;
first  = 261;                        

tau = 0.01;                        

% % DAX
lcare_DAX_001_c = zeros(36, n - first + 1); 
lcare_DAX_001_d = zeros(36, n - first + 1); 
et_DAX_001_c    = zeros(259, n - first + 1);  
et_DAX_001_d    = zeros(259, n - first + 1);  
yt_DAX_001_c    = zeros(259, n - first + 1);   
yt_DAX_001_d    = zeros(259, n - first + 1);  

% % FTSE
lcare_FTSE_001_c = zeros(36, n - first + 1); 
lcare_FTSE_001_d = zeros(36, n - first + 1); 
et_FTSE_001_c    = zeros(259, n - first + 1);  
et_FTSE_001_d    = zeros(259, n - first + 1);  
yt_FTSE_001_c    = zeros(259, n - first + 1);   
yt_FTSE_001_d    = zeros(259, n - first + 1);
 
% % SP
lcare_SP_001_c = zeros(36, n - first + 1); 
lcare_SP_001_d = zeros(36, n - first + 1); 
et_SP_001_c    = zeros(259, n - first + 1);  
et_SP_001_d    = zeros(259, n - first + 1);  
yt_SP_001_c    = zeros(259, n - first + 1);   
yt_SP_001_d    = zeros(259, n - first + 1);

% Critical Value 
z_k_Th2_005 = load('z_k_Th2_005');
z_k_Th1_005 = load('z_k_Th1_005');
z_k_Th3_005 = load('z_k_Th3_005');
z_k_Th1_001 = load('z_k_Th1_001');
z_k_Th2_001 = load('z_k_Th2_001');
z_k_Th3_001 = load('z_k_Th3_001');
z_005       = [z_k_Th1_005, z_k_Th2_005, z_k_Th3_005];
z_001       = [z_k_Th1_001, z_k_Th2_001, z_k_Th3_001];
z           = [z_005, z_001]; 
Data_date   = load('Data_date.txt');

for t = first : 1 : n   
    
    % % DAX
   [lcare_k, et_k, yt_k]             = LCARE_Test_Statistics_k_hat_Nms(r_DAX(t - 249 : 1 : t, :), tau, z);   
   lcare_DAX_001_c(:, t - first + 1) = [Data_date(t - 249, 1 : 3)'; Data_date(t, 1 : 3)'; t; lcare_k(:, 1)];
   lcare_DAX_001_d(:, t - first + 1) = [Data_date(t - 249, 1 : 3)'; Data_date(t, 1 : 3)'; t; lcare_k(:, 2)];
   et_DAX_001_c(:, t - first + 1)    = [Data_date(t - 249, 1 : 3)'; Data_date(t, 1 : 3)'; t; et_k(:, 1)];
   et_DAX_001_d(:, t - first + 1)    = [Data_date(t - 249, 1 : 3)'; Data_date(t, 1 : 3)'; t; et_k(:, 2)];
   yt_DAX_001_c(:, t - first + 1)    = [Data_date(t - 249, 1 : 3)'; Data_date(t, 1 : 3)'; t; yt_k(:, 1)];
   yt_DAX_001_d(:, t - first + 1)    = [Data_date(t - 249, 1 : 3)'; Data_date(t, 1 : 3)'; t; yt_k(:, 2)];
   
   % % FTSE
   [lcare_k, et_k, yt_k]              = LCARE_Test_Statistics_k_hat_Nms(r_FTSE(t - 249 : 1 : t, :), tau, z); 
   lcare_FTSE_001_c(:, t - first + 1) = [Data_date(t - 249, 1 : 3)'; Data_date(t, 1 : 3)'; t; lcare_k(:, 1)];
   lcare_FTSE_001_d(:, t - first + 1) = [Data_date(t - 249, 1 : 3)'; Data_date(t, 1 : 3)'; t; lcare_k(:, 2)];
   et_FTSE_001_c(:, t - first + 1)    = [Data_date(t - 249, 1 : 3)'; Data_date(t, 1 : 3)'; t; et_k(:, 1)];
   et_FTSE_001_d(:, t - first + 1)    = [Data_date(t - 249, 1 : 3)'; Data_date(t, 1 : 3)'; t; et_k(:, 2)];
   yt_FTSE_001_c(:, t - first + 1)    = [Data_date(t - 249, 1 : 3)'; Data_date(t, 1 : 3)'; t; yt_k(:, 1)];
   yt_FTSE_001_d(:, t - first + 1)    = [Data_date(t - 249, 1 : 3)'; Data_date(t, 1 : 3)'; t; yt_k(:, 2)];    
   
   % % SP
   [lcare_k, et_k, yt_k]            = LCARE_Test_Statistics_k_hat_Nms(r_SP(t - 249 : 1 : t, :), tau, z);  
   lcare_SP_001_c(:, t - first + 1) = [Data_date(t - 249, 1 : 3)'; Data_date(t, 1 : 3)'; t; lcare_k(:, 1)];
   lcare_SP_001_d(:, t - first + 1) = [Data_date(t - 249, 1 : 3)'; Data_date(t, 1 : 3)'; t; lcare_k(:, 2)];
   et_SP_001_c(:, t - first + 1)    = [Data_date(t - 249, 1 : 3)'; Data_date(t, 1 : 3)'; t; et_k(:, 1)];
   et_SP_001_d(:, t - first + 1)    = [Data_date(t - 249, 1 : 3)'; Data_date(t, 1 : 3)'; t; et_k(:, 2)];
   yt_SP_001_c(:, t - first + 1)    = [Data_date(t - 249, 1 : 3)'; Data_date(t, 1 : 3)'; t; yt_k(:, 1)];
   yt_SP_001_d(:, t - first + 1)    = [Data_date(t - 249, 1 : 3)'; Data_date(t, 1 : 3)'; t; yt_k(:, 2)];  
   
end

save('LCARE_001.mat');



