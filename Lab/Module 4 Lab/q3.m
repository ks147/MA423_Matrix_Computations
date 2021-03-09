format short e;

A_ = [[1 1 1; -1 9 2; 0 -1 2];
      [1 1 1; -1 3 2; -4 -1 2]];
tol = 10 ^ -10;

for i = 0 : 1
    A = A_(3 * i + 1 : 3 * i + 3, :);
    A = hess(A);
  
    [B2, k2] = CallFrancisQR(A, 1, tol);
    disp(B2);
    disp(k2);
    
    [B2, k2] = CallFrancisQR(A, 2, tol);
    disp(B2);
    disp(k2);
end