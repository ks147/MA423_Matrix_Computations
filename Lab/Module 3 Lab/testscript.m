
for n=2:20
    A = randn(n);
    for i=1:size(A,1)
        for j=1:size(A,1)
            if i > j+1
                A(i,j) = 0;
            end
        end
    end
    [Q,R] = reflectqr_hessenberg(A);
    tol = 1e-14;
    if norm(eye(n) - Q*Q') > tol || norm(A - Q*R) > tol
        disp('Incorrect');
        return;
    end
end

disp('Correct');