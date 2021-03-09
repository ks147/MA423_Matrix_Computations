function [B] = FrancisQRS(A)
    [ ~,n] = size(A);
    
    n = size(A,1);

    if(n==1)
        B=A;
        return;
    end
    
    rho = A(end,end);
    for k = 1:n-1
        if(k==1)
            m=1;
        else
            m=k-1;
        end    
        x = A(k:k+1,m);
        if(k==1)
            x(1) = x(1)-rho;
        end    
        [u,gamma,~] = reflect(x);
        A(k:k+1,m:n) = applreflect(u,gamma,A(k:k+1,m:n));
        A(m:n,k:k+1) = applreflect2(u,gamma,A(m:n,k:k+1));
    end
    B = A;
end