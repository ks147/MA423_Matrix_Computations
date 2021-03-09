clc;
close all;

n = input('size(n) of matrix A to be decomposed: ');
A = randn(n);
disp('A = ');
disp(A);
[L,U] = genp(A);
disp('L = ');
disp(L);
disp('U = ');
disp(U);
disp('L*U = ');
disp(L*U);
function [L,U] = genp(A)
    n = size(A,1);
    for k = 1:n-1
        if A(k,k) ~= 0
            A(k+1:n,k) = A(k+1:n,k)/A(k,k);
        else
            exit{'zero pivot encountered'};
        end
        
        A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - A(k+1:n,k)*A(k,k+1:n);
    end
    
    L = tril(A) - diag(A).*eye(n) + eye(n);
    U = triu(A);
    
end