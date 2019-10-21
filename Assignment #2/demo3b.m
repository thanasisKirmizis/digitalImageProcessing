%
%Presentation of recursive myNCuts function for just one step
%for images d2a and d2b
%

load('dip_hw_2.mat');
rng(1);

matr1 = Image2Graph(d2a);
matr2 = Image2Graph(d2b);

label2a = myNCuts(matr1 , 2);
label2b = myNCuts(matr2 , 2);

cut1 = calculateNcut(matr1,label2a);
cut2 = calculateNcut(matr2,label2b);

subplot(1,2,1), showClusteredImage(label2a);
subplot(1,2,2), showClusteredImage(label2b);

% Print the cut values and the labels if you want

% disp('Cut value with k=2 for image d2a: \n');
% disp(cut1);
% disp('Labels with k=2 for image d2a: \n');
% disp(label2a);
% 
% disp('Cut value with k=2 for image d2b: \n');
% disp(cut2);
% disp('Labels with k=2 for image d2b: \n');
% disp(label2b);

