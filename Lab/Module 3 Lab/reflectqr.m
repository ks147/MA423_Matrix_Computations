function [Q,R]=reflectqr(A)
    % Computing R takes (4n^3)/3 + O(n^2) flops
    % Computing Q takes (4n^3)/3 + O(n^2) flops
    % Total Flops (8n^3)/3 + O(n^2) flops
    [n,m]=size(A);
    if (m>n)
        exit('A is supposed to be a tall or square matrix. Here m>n.')
    end
    gam=zeros(m,1);
    Q=eye(n);
    for i=1:m
        x=A(i:n,i);
        [u,gamma,t]=reflect(x);
        gam(i)=gamma;
        %In case of square matrix, we only need n-1 iterations to compute R
        if ~(n==m && i==n)
            A(i:n,i+1:m)=applreflect(u,gamma,A(i:n,i+1:m));
        end
        A(i:n,i)=u;
        A(i,i)=-t;
        % Computing Q, Q_hat*ek = Q1*Q2*......*Qk*ek
        % Q = [Q_hat*e1 Q_hat*e2 .... Q_hat*em]
        for j=i:-1:1
            u=zeros(n-j+1,1);
            u(2:end) = A(j+1:n,j);
            u(1)=1;
            Q(j:n,i)=applreflect(u,gam(j),Q(j:n,i));
        end
    end
    % when n>m, calculating the the orthogonal columns m+1:n
    for i=m+1:n
        for j=m:-1:1
            gamma=gam(j);
            u=zeros(n-j+1,1);
            u(2:end) = A(j+1:n,j);
            u(1)=1;
            Q(j:n,i)=applreflect(u,gamma,Q(j:n,i));
        end
    end
    R=triu(A);
end