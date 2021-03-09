clc;
clear all;
n = input('Size of Positive Symmetric Matrix A: ');
a = 1;
b = 3;

r = a + (b - a).*rand(n,1);
D = diag(r);
B = randn(n);
[Q,R] = qr(B);
A = Q'*D*Q;
disp('Output of mycholb(A)');
mycholb(D)
disp('Output of chol(A)');
chol(D)

