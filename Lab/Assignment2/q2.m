clc;
clear all;

n = input('Give input size of random matrix: ');
A = randn(n);

disp('Output of [L,U,p] = gepp(A)');
[L,U,p] = gepp(A)

disp('Output of in-built [L,U,p] = lu(A)');
[L,U,p] = lu(A)