function R=reflectqr(A)
    [n,m]=size(A);    
    g=zeros(m,1);
    if m==n
        p=n-1;
    else
        p=m;
    end
    for i=1:p
        x=A(i:n,i);
        [u,gamma,t]=reflect(x);
        g(i)=gamma;
        A(i:n,i+1:m)=applreflect(u,gamma,A(i:n,i+1:m));
        A(i,i)=-t;
    end
    R=triu(A);
end