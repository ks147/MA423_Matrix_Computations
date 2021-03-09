function B = FrancisQRD(A) 
    [n, ~] = size(A);
    
    if n == 1
        B = A; 
        return;
    else
        %Get the eigen values of A(n-1:n,n-1:n) in the
        %generalised Rayleigh Quotient shifting strategy.
        [~, D] = eig(A(n - 1 : n, n - 1 : n));
        rho = D(1, 1);
        tau = D(2, 2);
    end
    
    I = eye(n);
    X = (A - rho * I) * (A - tau * I);
    [u, gamma, ~] = reflect(X(1 : 3, 1));
    B = A;
    B(1 : 3, 1 : n) = applreflect(u, gamma, B(1 : 3, 1 : n));
    B(1 : n, 1 : 3) = applreflect2(u, gamma, (B(1 : n, 1 : 3)));
    for i = 1 : n - 2        
        if(i + 3 > n)
            m = n;
        else
            m = i + 3;
        end
        
        [u, gamma, t] = reflect(B(i + 1 : m, i));
        B(i + 1, i) = -t;
        B(i + 2 : m, i) = zeros(m - i - 1, 1);
        B(i + 1 : m, i + 1 : n) = applreflect(u, gamma, B(i + 1 : m, i + 1 : n));
        B(i : n, i + 1 : m) = applreflect2(u, gamma, (B(i : n, i + 1 : m)));
    end  
    
end