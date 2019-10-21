function[x] = imagedequant(q,w1,w2,w3)

%Dequantize Red
s1 = mydequant(q(:,:,1),w1);        

%Dequantize Green
s2 = mydequant(q(:,:,2),w2);        

%Dequantize Blue
s3 = mydequant(q(:,:,3),w3); 

%Merge the three matrices
x = cat(3,s1,s2,s3);                

end