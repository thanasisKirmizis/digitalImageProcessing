%
%This function calculates and returns the affinity matrix of the graph  
%that describes an input image. As a metric, it uses the euclidean distance   
%between the intensity values of each channel of the image.
%
%The implementation could be improved in the future to limit the use of 
%'for' loops and also to use the symmetricity of the affinity matrix to
%get half the complexity. For now, it works good that way.
%

function [affinityMatrix] = Image2Graph(imIn)

len = size(imIn,1);                     %Size of rectangular matrix
ord = size(imIn,3);                     %Order: number of channels of matrix

affinityMatrix = zeros(len^2, len^2);   %Matrix initialization

for k=1:len                             %The filling of the matrix
    for l=1:len
        for i=1:len    
            for j=1:len
                dist = 0;
                for o=1:ord 
                    dist = dist + (imIn(k,l,o) - imIn(i,j,o))^2; 
                end
                affinityMatrix((k-1)*len+l,(i-1)*len+j) = 1/exp(sqrt(dist));
            end
        end
    end
end

end