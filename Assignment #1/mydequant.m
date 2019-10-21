function[x] = mydequant(qsymbols,w)

M = size(qsymbols,1);
N = size(qsymbols,2);

x = zeros(M,N);

%The dequantization of x with step w is here
x = w*(qsymbols+1);

%Adjust for negative values in x
nonposidx = qsymbols<0;
x = x - w*nonposidx;

end
        