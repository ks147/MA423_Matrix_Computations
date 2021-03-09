clc;
T_gauss = [];

T_inv = [];
for i=linspace(200,1150,20)
    A = randn(i);
    b = randn(i,1);
    tic;
%     Time taken for Gaussian elimination
    x = A\b;
    T_gauss = [T_gauss;toc];
%     Inverse time 
    tic;
    x = inv(A)*b;
    T_inv = [T_inv;toc];
    
end

semilogx(linspace(200,1150,20),T_gauss);
hold on;
semilogx(linspace(200,1150,20),T_inv);
legend('Gaussian','inverse');
xlabel('Time');
ylabel('Size of Matrix');