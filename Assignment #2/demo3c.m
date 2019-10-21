%
%Presentation of recursive myNCuts and calculateNcut functions for images 
%d2a and d2b with thresholds T1 = 5 and T2 = 0.8
%This script needs to call a function in order to work recursevily
%

clear('global');
load('dip_hw_2.mat');
rng(1);

T1 = 5;
T2 = 0.8;

parent = Image2Graph(d2a);

parentLabel = myNCuts(parent , 2);
parentCut = calculateNcut(parent, parentLabel);

nmbrOfLeftNodes = nnz(parentLabel==1);
nmbrOfRightNodes = nnz(parentLabel==2);

startingIndexes = ones(size(parentLabel,1),1);

global toReturn;

recursionTree(parent, parentLabel, parentCut, nmbrOfLeftNodes, nmbrOfRightNodes, T1, T2, startingIndexes);

nmbrOfLeaves = size(toReturn,2);

labelsToShow = zeros(size(parentLabel,1),1);

for i=1:nmbrOfLeaves
   labelsToShow = labelsToShow + toReturn{i}*i;
end

%-----------------------------------

parent2 = Image2Graph(d2b);

parentLabel2 = myNCuts(parent2 , 2);
parentCut2 = calculateNcut(parent2, parentLabel2);

nmbrOfLeftNodes2 = nnz(parentLabel2==1);
nmbrOfRightNodes2 = nnz(parentLabel2==2);

startingIndexes2 = ones(size(parentLabel2,1),1);

clear('global');
global toReturn2;

recursionTree(parent2, parentLabel2, parentCut2, nmbrOfLeftNodes2, nmbrOfRightNodes2, T1, T2, startingIndexes2);

nmbrOfLeaves2 = size(toReturn2,2);

labelsToShow2 = zeros(size(parentLabel2,1),1);

for i=1:nmbrOfLeaves2
   labelsToShow2 = labelsToShow2 + toReturn2{i}*i;
end

%-----------------------------------

subplot(1,2,1), showClusteredImage(labelsToShow);
subplot(1,2,2), showClusteredImage(labelsToShow2);
