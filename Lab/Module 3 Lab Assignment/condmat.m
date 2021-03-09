function A = condmat(m,n,kappa)
    X = randn(m,n);
    [U,D,V]=svd(X);
    for i=1:min(m,n)
       D(i,i) = kappa^((i-1)/(min(m,n)-1)); 
    end
    A = U*D*V';
end