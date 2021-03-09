clear all
clc;
format long e

t = [-5:0.5:6]';

f = @(t) sin(pi.*t./5) + (t./5);
deg = 18;

A = zeros(length(t),deg);

for j=1:deg
   A(:,j) =  t.^(j - 1);
end

b = f(t);

p1 = A\b;
r1 = norm(A*p1-b)

G = chol(A'*A);
y = rowforward(G',A'*b);
p2 = colbackward(G,y);
r2 = norm(A*p2-b)

A_hat = [eye(23),A;A',zeros(deg,deg)];
b_hat = [b;zeros(18,1)];
x_hat = A_hat\b_hat;
p3 = x_hat(24:end);
r3 = norm(x_hat(1:23))