clc;
clear all;

% (a) 
n = input('Input size of Upper Triangular Matrix(n): ');
fprintf('Solve system Ux = b\n');

U = triu(randn(n));
b = randn(n,1);
disp('U =');
disp(U);
disp('b =');
disp(b);
disp('x = ');
disp(colbackward(U,b));
% disp(U\b);

% (b) 
n = input('Input size of Lower Triangular Matrix(n): ');
fprintf('Solve system lx = b\n');

l = tril(randn(n));
b = randn(n,1);
disp('l =');
disp(l);
disp('b =');
disp(b);
disp('x = ');
disp(rowforward(l,b));
% disp(l\b);
% (a) Upper Triangular Matrix
function b = colbackward(U,b)
    n = size(U,1);
    
    for j=n:-1:1
        if U(j,j) ~= 0
            b(j) = b(j)/U(j,j);
        else
            exit{'Matrix is singular'};
        end
        
        for i = j-1:-1:1
            b(i) = b(i) - U(i,j)*b(j);
        end
    end
        
end
% (b) Lower Triangular Matrix 
function b = rowforward(l,b)
    n = size(l,1);

    for k=1:n
        for j=1:k-1
            b(k) = b(k) - l(k,j)*b(j);
        end
        
        if l(k,k) ~= 0
            b(k) = b(k)/l(k,k);
        else
            exit{'Matrix is singular'};
        end
    end
end