%
%This is a helper function to convert the vector of labels of a rectangular    
%clustered image back into an image (recatngular matrix). The resulting 
%image is grayscale, with k shades of gray.
%

function showClusteredImage(labels)

len = round(sqrt(size(labels,1)));          %Size of new rectangular image
clstrd = zeros(len,len);                    %Matrix initialization
k = max(labels);                            %Number of clusters

for i=1:len                                 %Filling of the image matrix
    for j=1:len
        clstrd(i,j) = labels((i-1)*len + j)/k;
    end
end

imshow(clstrd);                             %Display the resulting image

end