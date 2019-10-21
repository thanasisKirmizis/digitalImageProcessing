%
%This function takes as arguments a color matrix (R,G,B) of
%dimensions MxN and fills the empty (zero) cells with interpolated values.
%The method used to fill the cells is called 'Nearest-Neighbor'.
%

function [Color] = mynearest(c, M, N)

Color = c;                                                  %Initialize color matrix                                      

for i=1:M
    for j=1:N
        if c(i,j)==0                                        %If a cell is empty
            dist=0;                                         
            flag = 1;
            while(flag)
                dist=dist+1;                                % Increase the searching distance every loop
                
                if ((j-dist)>0 && c(i,j-dist)>0)            % Firstly search horizontally and vertically
                    Color(i,j)=c(i,j-dist);                 % (like a cross) for given distance
                    break;                                  % 
                elseif ((j+dist)<=N && c(i,j+dist)>0)       % Search is being done this way:
                    Color(i,j)=c(i,j+dist);                 % right->left->up->down  
                    break;                                  %
                elseif ((i-dist)>0 && c(i-dist,j)>0)        %
                    Color(i,j)=c(i-dist,j);                 %
                    break;                                  %
                elseif ((i+dist)<=M && c(i+dist,j)>0)       %
                    Color(i,j)=c(i+dist,j);                 %
                    break;                                  %
                end                                         %
                
                for k=1:dist                                % Then search also diagonally 
                                                            % (like a box) for given distance                                                                                                                         
                    if (i+dist)<M                           % 
                                                            % 
                        if (j+k)<N && c(i+dist,j+k)>0       % Search is being done this way:
                            Color(i,j)=c(i+dist,j+k);       % right down -> left down ->
                            flag = 0;                       % right up -> left up
                            break;                          %
                        elseif (j-k)>0 && c(i+dist,j-k)>0   %
                            Color(i,j)=c(i+dist,j-k);       %
                            flag = 0;                       %
                            break;                          %
                        end                                 %
                                                            %
                    elseif (i-dist)>0                       %
                                                            %
                        if (j+k)<N && c(i-dist,j+k)>0       %
                            Color(i,j)=c(i-dist,j+k);       %
                            flag = 0;                       %
                            break;                          %
                        elseif (j-k)>0 && c(i-dist,j-k)>0   %
                            Color(i,j)=c(i-dist,j-k);       %
                            flag = 0;                       %
                            break;                          %
                        end                                 %
                                                            %
                    elseif (j+dist)<N                       %
                                                            %
                        if (i+k)<M && c(i+k,j+dist)>0       %
                            Color(i,j)=c(i+k,j+dist);       %
                            flag = 0;                       %
                            break;                          %
                        elseif (i-k)>0 && c(i-k,j+dist)>0   %
                            Color(i,j)=c(i-k,j+dist);       %
                            flag = 0;                       %
                            break;                          %
                        end                                 %
                                                            %
                    elseif (j-dist)>0                       %
                                                            %
                        if (i+k)<M && c(i+k,j-dist)>0       %
                            Color(i,j)=c(i+k,j-dist);       %
                            flag = 0;                       %
                            break;                          %
                        elseif (i-k)>0 && c(i-k,j-dist)>0   %
                            Color(i,j)=c(i-k,j-dist);       %
                            flag = 0;                       %
                            break;                          %
                        end                                 %
                                                            %
                    end                                     %
                                                            %
                end                                         %
            end                                             
                
        end
    end
end

end