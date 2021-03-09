clc;
clear all;
n = input('Input size of Matrix A: ');
A = randn(n)
b = randn(n,1)
disp('Solution using geppsolve(A,b)');
x = geppsolve(A,b)
disp('Solution using A\b');
x = A\b