%
%This function takes as arguments a color matrix (R,G,B) of
%dimensions MxN and fills the empty (zero) cells with interpolated values.
%The method used to fill the cells is called 'Bilinear'.
%

function [Color] = mybilinear(c, M, N)

Color = c;                                                  % Initialize color matrix

for i=1:M
    for j=1:N
        if c(i,j)==0                                        % If a cell is empty
            sum = 0;
            weight = 0;
            counter = 0;                                    % A counter to know when 4 pixels have been added to the sum 
            dist = 0;
            flag = 1;
            while(flag)
                dist=dist+1;                                % Increase the searching distance every loop
                
                if ((j-dist)>0 && c(i,j-dist)>0)            % Firstly search horizontally and vertically
                    sum=sum+c(i,j-dist)/dist;               % (like a cross) for given distance
                    weight=weight+1/dist;                   % 
                    counter = counter + 1;                  % Search is being done this way:
                    if counter == 4                         % right->left->up->down
                        break;                              %
                    end                                     % When one cell is found filled, add its weighted  
                end                                         % value to the variable sum and also add its weight 
                if ((j+dist)<=N && c(i,j+dist)>0)           % to the variable weight
                    sum=sum+c(i,j+dist)/dist;               %
                    weight=weight+1/dist;                   % The weight of each cell results from the inverse 
                    counter = counter + 1;                  % of the euclidean distance from the empty cell
                    if counter == 4                         % 
                        break;                              % When 4 pixels have been added to the sum, the loop ends 
                    end                                     % and the empty cell is filled with the weighted average
                end                                         % of those 4 pixels
                if ((i-dist)>0 && c(i-dist,j)>0)            %
                    sum=sum+c(i-dist,j)/dist;               %
                    weight=weight+1/dist;                   %
                    counter = counter + 1;                  %
                    if counter == 4                         % Then search also diagonally
                        break;                              % (like a box) for given distance
                    end                                     %
                end                                         % Search is being done this way:
                if ((i+dist)<=M && c(i+dist,j)>0)           % right down -> left down ->
                    sum=sum+c(i+dist,j)/dist;               % right up -> left up
                    weight=weight+1/dist;                   %
                    counter = counter + 1;                  % Process of filling is same as before
                    if counter == 4                         %
                        break;                              %
                    end                                     %
                end                                         %
                
                for k=1:dist                                 
                                                             
                    if (i+dist)<M
                        
                        if (j+k)<N && c(i+dist,j+k)>0
                            sum=sum+c(i+dist,j+k)/sqrt(dist^2+k^2);
                            weight=weight+1/sqrt(dist^2+k^2);
                            counter = counter + 1;
                            if counter == 4
                                flag = 0;
                                break;
                            end
                        end
                        if (j-k)>0 && c(i+dist,j-k)>0
                            sum=sum+c(i+dist,j-k)/sqrt(dist^2+k^2);
                            weight=weight+1/sqrt(dist^2+k^2);
                            counter = counter + 1;
                            if counter == 4
                                flag = 0;
                                break;
                            end
                        end
                        
                    end
                    
                    if (i-dist)>0
                        
                        if (j+k)<N && c(i-dist,j+k)>0
                            sum=sum+c(i-dist,j+k)/sqrt(dist^2+k^2);
                            weight=weight+1/sqrt(dist^2+k^2);
                            counter = counter + 1;
                            if counter == 4
                                flag = 0;
                                break;
                            end
                        end
                        if (j-k)>0 && c(i-dist,j-k)>0
                            sum=sum+c(i-dist,j-k)/sqrt(dist^2+k^2);
                            weight=weight+1/sqrt(dist^2+k^2);
                            counter = counter + 1;
                            if counter == 4
                                flag = 0;
                                break;
                            end
                        end
                        
                    end
                    
                    if (j+dist)<N
                        
                        if (i+k)<M && c(i+k,j+dist)>0
                            sum=sum+c(i+k,j+dist)/sqrt(dist^2+k^2);
                            weight=weight+1/sqrt(dist^2+k^2);
                            counter = counter + 1;
                            if counter == 4
                                flag = 0;
                                break;
                            end
                        end
                        if (i-k)>0 && c(i-k,j+dist)>0
                            sum=sum+c(i-k,j+dist)/sqrt(dist^2+k^2);
                            weight=weight+1/sqrt(dist^2+k^2);
                            counter = counter + 1;
                            if counter == 4
                                flag = 0;
                                break;
                            end
                        end
                        
                    end   
                    
                    if (j-dist)>0
                        
                        if (i+k)<M && c(i+k,j-dist)>0
                            sum=sum+c(i+k,j-dist)/sqrt(dist^2+k^2);
                            weight=weight+1/sqrt(dist^2+k^2);
                            counter = counter + 1;
                            if counter == 4
                                flag = 0;
                                break;
                            end
                        end
                        if (i-k)>0 && c(i-k,j-dist)>0
                            sum=sum+c(i-k,j-dist)/sqrt(dist^2+k^2);
                            weight=weight+1/sqrt(dist^2+k^2);
                            counter = counter + 1;
                            if counter == 4
                                flag = 0;
                                break;
                            end
                        end
                        
                    end
                    
                end
                
            end
            
            Color(i,j)= sum/weight;
        end
    end
end

end

