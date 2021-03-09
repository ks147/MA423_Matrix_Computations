clc;
% (a)
A = [10^-20,1;1,1];
[L,U] = genp(A)
disp('A - L*U = ');
disp(A - L*U);

%(b) solving Ax = b
b = [1;0];

% Solve these 2 eqs using rowforward and colforward
% Ly = b
% Ux = y
y = rowforward(L,b);
x = colbackward(U,y);
disp('Solution using genp');
disp(x);

x_actual = A\b;
disp('Actual solution of Ax = b');
disp(x_actual);

fprintf('2-norm of difference between actual solution and genp =  %f\n',...
    norm(x_actual - x,2));
