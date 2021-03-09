clear all;
clc;
close all;

% Wilkinson(n)
Wilkinson(input("Input Wilkinson(n): "));
% (b) Hamiltonian
Hamiltonian(input("Input Hamiltonian(n): "));
% (a)
function Wilkinson(n)
    disp(2*eye(n) - tril(ones(n)));
end



function Hamiltonian(n)
    H = zeros(2*n,2*n);
    
    H_12 = diag(randn(n,1));
    non_diagonal = tril(randn(n));
    H_12 =  non_diagonal + non_diagonal';
    H_21 = diag(randn(n,1));
    non_diagonal = tril(randn(n));
    H_21 = non_diagonal + non_diagonal';
    H(1:n,1:n) = randn(n);
    H(n+1:2*n,n+1:2*n) = -H(1:n,1:n)';
    H(n+1:2*n,1:n) = H_21;
    H(1:n,n+1:2*n) = H_12;
    disp(H);
    
end
