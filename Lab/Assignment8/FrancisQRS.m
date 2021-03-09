function B = FrancisQRS(A)
    n = size(A,1);
    rho = A(end,end);
    for k = 1:n-1
        m = max(1,k-1);
        x = A(k:k+1,m); 
        x(1) = x(1)-rho*(k==1);
        [u,gamma,~] = reflect(x);
        A(k:k+1,m:n) = applreflect(u,gamma,A(k:k+1,m:n));
        A(m:n,k:k+1) = A(m:n,k:k+1) - A(m:n,k:k+1)*gamma*u*u';
    end
    B = A;
end



