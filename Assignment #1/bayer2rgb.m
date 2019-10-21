%
%This function practically resizes the initial matrix x to the given dimensions MxN, 
%and then calls nearest or bilinear to interpolate the colors 
%

function [Red, Green, Blue] = bayer2rgb(x, M, N, method)
 
M0 = size(x,1);                %Height dimension
N0 = size(x,2);                %Width dimension
                                    
Mratio = M/M0;                 %Scale factors
Nratio = N/N0;                 % 

Red = zeros(M, N);             %Color matrices
Green = zeros(M, N);           % 
Blue = zeros(M, N);            %

for i=1:M0
    for j=1:N0
        if (mod(i,2)==1)&&(mod(j,2)==1)     %According to Bayer filter, when i and j are odd, pixel is GREEN
            
            if (i==1 && j==1)               %Adjust the four corner green pixels 
                Green(i,j) = x(i,j);        %of the initial matrix x 
            elseif (i==M0 && j==1)          %to match exactly the four corner
                Green(M,j) = x(i,j);        %green pixels of the new scaled matrix
            elseif (i==M0 && j==N0)         %
                Green(M,N) = x(i,j);        %
            elseif (i==1 && j==N0)          %
                Green(1,N) = x(i,j);        %
                
            else                                                    %And place all the other green pixels at
                Green(round(Mratio*i),round(Nratio*j)) = x(i,j);    %intervals of Mratio and Nratio (rounded)
            end                                                     %
            
        elseif (mod(i,2)==0)&&(mod(j,2)==0) %According to Bayer filter, when i and j are even, pixel is GREEN
            
            if (i==1 && j==1)               %Adjust the four corner green pixels 
                Green(i,j) = x(i,j);        %of the initial matrix x 
            elseif (i==M0 && j==1)          %to match exactly the four corner
                Green(M,j) = x(i,j);        %green pixels of the new scaled matrix
            elseif (i==M0 && j==N0)         %
                Green(M,N) = x(i,j);        %
            elseif (i==1 && j==N0)          %
                Green(1,N) = x(i,j);        %
                
            else                                                    %And place all the other green pixels at
                Green(round(Mratio*i),round(Nratio*j)) = x(i,j);    %intervals of Mratio and Nratio (rounded)
            end                                                     %
            
        elseif (mod(i,2)==1)&&(mod(j,2)==0) %According to Bayer filter, when i is even and j is odd, pixel is BLUE
            
            if (i==1 && j==1)               %Adjust the four corner blue pixels
                Blue(i,j) = x(i,j);         %of the initial matrix x 
            elseif (i==M0 && j==1)          %to match exactly the four corner
                Blue(M,j) = x(i,j);         %blue pixels of the new scaled matrix
            elseif (i==M0 && j==N0)         %
                Blue(M,N) = x(i,j);         %   
            elseif (i==1 && j==N0)          %
                Blue(1,N) = x(i,j);         %
                
            else                                                   %And place all the other blue pixels at
                Blue(round(Mratio*i),round(Nratio*j)) = x(i,j);    %intervals of Mratio and Nratio (rounded)
            end                                                    %
            
        elseif (mod(i,2)==0)&&(mod(j,2)==1) %According to Bayer filter, when i is odd and j is even, pixel is RED
            
            if (i==1 && j==1)               %Adjust the four corner red pixels
                Red(i,j) = x(i,j);          %of the initial matrix x
            elseif (i==M0 && j==1)          %to match exactly the four corner
                Red(M,j) = x(i,j);          %red pixels of the new scaled matrix
            elseif (i==M0 && j==N0)         %
                Red(M,N) = x(i,j);          %
            elseif (i==1 && j==N0)          %
                Red(1,N) = x(i,j);          %
                
            else                                                   %And place all the other red pixels at
                Red(round(Mratio*i),round(Nratio*j)) = x(i,j);     %intervals of Mratio and Nratio (rounded)
            end                                                    %
            
        end
    end
end

if (strcmp(method,'linear'))                                       %For the interpolation, call the inputted method
    Red = mybilinear(Red,M,N);                                     % 
    Green = mybilinear(Green,M,N);                                 %
    Blue = mybilinear(Blue,M,N);                                   %
                                                                   %
elseif (strcmp(method,'nearest'))                                  % 
    Red = mynearest(Red,M,N);                                      %
    Green = mynearest(Green,M,N);                                  %
    Blue = mynearest(Blue,M,N);                                    %
                                                                   % 
else                                                               % 
    disp('Error: Method unknown.');                                % 
                                                                   %     
end                                                                %
    
end
