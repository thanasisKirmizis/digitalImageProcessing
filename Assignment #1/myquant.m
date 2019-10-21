function[qsymbols] = myquant(x,w)

M = size(x,1);
N = size(x,2);

qsymbols = zeros(M,N);
qtemp = zeros(M,N);

%The quantization of x with step w is here
%Method I followed uses the round() function instead of maybe ceil() 
qtemp = w*round(x/w);                 
qsymbols = qtemp/w - 1;

%Adjust for negative values in x
nonposidx = qtemp<=0;
qsymbols = qsymbols + nonposidx;

end
        