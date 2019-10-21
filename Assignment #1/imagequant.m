function[q] = imagequant(x,w1,w2,w3)

%Quantize Red
s1 = myquant(x(:,:,1),w1);

%Quantize Green
s2 = myquant(x(:,:,2),w2);  

%Quantize Blue
s3 = myquant(x(:,:,3),w3);     

%Merge the three matrices
q = round(cat(3,s1,s2,s3));     

end