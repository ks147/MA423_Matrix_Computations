function R=mychol(A)
    if A(1,1) < 0
       error("Matrix is not positive definite") 
    end
    
    n=size(A,1);
    
    if (n==1)
        R=sqrt(A(1,1));
        return;
    end
    
    b = A(1,2:n)';
    g11 = sqrt(A(1,1));
    g = b/g11;
    A_hat = A(2:n,2:n);
    R = zeros(n,n);
    R(1,1) = g11;
    R(1,2:n) = g';
    R(2:n,2:n) = mychol(A_hat - g*g');
    
end