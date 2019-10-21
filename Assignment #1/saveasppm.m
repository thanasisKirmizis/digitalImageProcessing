function[] = saveasppm(x,filename,k)

%Height dimension converted to ASCII
M = size(x,1);
strM = int2str(M);
asciiM = double(strM);

%Width dimension converted to ASCII
N = size(x,2);
strN = int2str(N);
asciiN = double(strN);

%K (number of steps of quantization) converted to ASCII 
strK = int2str(k);
asciiK = double(strK);

%Header of .ppm file in ASCII
header = [80 54 32 asciiN 32 asciiM 32 asciiK 10];

%Body of .ppm file here
ppmtable = zeros([1 M*N*3]);
counter = 1;

%Fill the table according to the .ppm format (R->G->B)
for i=1:M
    for j=1:N
        ppmtable(counter) = x(i,j,1);
        counter = counter + 1;
        ppmtable(counter) = x(i,j,2);
        counter = counter + 1;
        ppmtable(counter) = x(i,j,3);
        counter = counter + 1;
    end
end

%Merge header and body
all = [header ppmtable];

%Save .ppm file
fid=fopen(filename,'w');
fprintf(fid,'%s', all);
fclose(fid);
    
end