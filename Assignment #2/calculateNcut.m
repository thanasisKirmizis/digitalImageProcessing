%
%This function calculates and returns the nCut value between two groups of   
%nodes. It takes as input the affinity matrix of the graph and the labels   
%of the nodes the correspond to the two clusters. The lesser the nCut
%value, the better the cut has been.
%

function [nCutValue] = calculateNcut(affMatrix , labels)
    
    len = size(affMatrix, 1);               %Size of rectangular matrix

    function [Nassoc] = calcNassoc(A, B, V) %Formula function for better readability
        
        Nassoc = calcAssoc(A,A)/calcAssoc(A,V) + calcAssoc(B,B)/calcAssoc(B,V) ;
        
    end

    function [assoc] = calcAssoc(X, Y)      %Formula function for better readability
       
        assoc = 0;
        
        if Y == 0                           %0 here means that the whole graph V has been inputted
            for u=1:len
                if labels(u) == X
                    assoc = assoc + sum(affMatrix(u,:));
                end
            end
        else
            for u=1:len
                for t=1:len
                    if labels(u) == X
                        if labels(t) == Y
                            assoc = assoc + affMatrix(u,t);
                        end
                    end
                end
            end
        end
        
    end

    nCutValue = 2 - calcNassoc(1,2,0);      %Formula to get the desirable value

end