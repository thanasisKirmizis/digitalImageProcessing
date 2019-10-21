%
%Presentation of mySpectralClustering function for affinity matrix d1a
%

load('dip_hw_2.mat');
rng(1);

label2 = mySpectralClustering(d1a , 2);
label3 = mySpectralClustering(d1a , 3);
label4 = mySpectralClustering(d1a , 4);

% Print all the labels if you want
% 
% disp('Labels with k=2: \n');
% disp(label2);
% disp('Labels with k=3: \n');
% disp(label3);
% disp('Labels with k=4: \n');
% disp(label4);