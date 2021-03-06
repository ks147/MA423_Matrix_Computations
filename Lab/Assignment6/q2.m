warning('off','all');
clc
clear all
k=100;
load clown.mat; 
[U, S, V] = svd(X); 
colormap('gray');
image(U(:, 1:k)*S(1:k, 1:k)*V(:,1:k)')

K = [50:10:190];

i = 1;
for k = K
   compression(i) = 520*k/64000; 
   error(i) = S(k+1,k+1)/S(1,1);
   i=i+1;
end    

fprintf('\t k \t Compression Ratio \t Error \n')
for i = 1:length(K)
   fprintf('\t %d \t %f \t\t %f \n',K(i),compression(i),error(i)) 
end    
    

