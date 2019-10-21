%
%Presentation of Image2Graph and mySpectralClustering functions 
%for images d2a and d2b
%

load('dip_hw_2.mat');
rng(1);

matr1 = Image2Graph(d2a);
matr2 = Image2Graph(d2b);

label2a = mySpectralClustering(matr1 , 2);
label3a = mySpectralClustering(matr1 , 3);
label4a = mySpectralClustering(matr1 , 4);

label2b = mySpectralClustering(matr2 , 2);
label3b = mySpectralClustering(matr2 , 3);
label4b = mySpectralClustering(matr2 , 4);

subplot(2,3,1), showClusteredImage(label2a);
subplot(2,3,2), showClusteredImage(label3a);
subplot(2,3,3), showClusteredImage(label4a);

subplot(2,3,4), showClusteredImage(label2b);
subplot(2,3,5), showClusteredImage(label3b);
subplot(2,3,6), showClusteredImage(label4b);

% Print all the labels if you want

% disp('Labels with k=2 for image d2a: \n');
% disp(label2a);
% disp('Labels with k=3 for image d2a: \n');
% disp(label3a);
% disp('Labels with k=4 for image d2a: \n');
% disp(label4a);
% 
% disp('Labels with k=2 for image d2b: \n');
% disp(label2b);
% disp('Labels with k=3 for image d2b: \n');
% disp(label3b);
% disp('Labels with k=4 for image d2b: \n');
% disp(label4b);

