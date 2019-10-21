%
%This function calculates and returns a matrix that contains labels for   
%the nodes of the graph using the k-means algorithm with the k smallest 
%eigenvalues.
%

function [clusterIdx] = myNCuts(affMatrix ,k)

len = size(affMatrix, 1);           %Size of rectangular matrix
Deg = zeros(len,len);               %Matrix initialization

for i=1:len
    Deg(i,i) = sum(affMatrix(i,:)); %Fill Degree matrix according to the formula
end

L = Deg - affMatrix;                %Create Laplacian matrix according to the formula

[U, V] = eigs(L,Deg,k,'sm');        %Solve the k smallest generalized eigenvalues problem

clusterIdx = kmeans(U,k);           %Label each node to its approporiate cluster using the k-means algorithm

end