%
%This is a helper function to recursively execute nCuts, and hence create    
%the binary tree of the parent node that is the initial affinity matrix.  
%It returns all the information from the leaf nodes that is required to
%display the resulting segmented image. The code for this function is
%pretty much trash, and hence will not be furthermore commented. Just accept
%that it works. :)
%

function recursionTree(parent, parentLabel, parentCut, nmbrOfLeftNodes, nmbrOfRightNodes, T1, T2, theTable)
    
    global toReturn;
    global toReturn2;
    
    if parentCut < T2 && nmbrOfLeftNodes > T1 && nmbrOfRightNodes > T1

        childLeft = createChild(parentLabel, parent, 1);

        childLeftLabel = myNCuts(childLeft, 2);
        childLeftCut = calculateNcut(childLeft, childLeftLabel);

        nmbrOfLeftNodes = nnz(childLeftLabel==1);
        nmbrOfRightNodes = nnz(childLeftLabel==2);
        
        newIndex = zeros(size(theTable));
        m = 1;
        
        for k=1:size(theTable,1);
            if theTable(k) == 1
                if parentLabel(m) == 1
                    newIndex(k) = 1;
                end
                m = m+1;
            end
        end

        recursionTree(childLeft, childLeftLabel, childLeftCut, nmbrOfLeftNodes, nmbrOfRightNodes, T1, T2, newIndex);
        
        %----------------

        childRight = createChild(parentLabel, parent, 2);

        childRightLabel = myNCuts(childRight, 2);
        childRightCut = calculateNcut(childRight, childRightLabel);

        nmbrOfLeftNodes = nnz(childRightLabel==1);
        nmbrOfRightNodes = nnz(childRightLabel==2);
        
        newIndex = zeros(size(theTable));
        m = 1;
        
        for k=1:size(theTable,1);
            if theTable(k) == 1
                if parentLabel(m) == 2
                    newIndex(k) = 1;
                end
                m = m+1;
            end
        end

        recursionTree(childRight, childRightLabel, childRightCut, nmbrOfLeftNodes, nmbrOfRightNodes, T1, T2, newIndex);

    else

         toReturn{size(toReturn,2)+1} = theTable;
         toReturn2 = toReturn;
        
    end
    
    function [child] = createChild(parentLabel, parent, clstr)

        teamIndexes = find(parentLabel==clstr).';
        child = zeros(size(teamIndexes,1),size(teamIndexes,1));
        row = 1;
        col = 1;

        for i = teamIndexes
            for j = teamIndexes
                child(row,col) = parent(i,j);
                col = col + 1;
            end
            row = row + 1;
            col = 1;
        end

    end

end