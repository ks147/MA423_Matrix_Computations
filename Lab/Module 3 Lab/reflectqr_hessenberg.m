function [Q,R]=reflectqr_hessenberg(A)
    % Takes O(n^2) flops 
    % We only need to make 1 entry 0 (at max). Therefore we apply the
    % reflector matrix of size 2 in all columns.
    [n,m]=size(A);
    if (m~=n)
        exit('Hessenberg Matrices are square.Here m!=n')
    end
    gam=zeros(m,1);
    Q=eye(n);
    % Since Hessenberg is square matrix, m-1 iterations are required to compute R 
    for i=1:m-1
        % We only need to change make the A(j+1,j) entry zero, Rest are
        % already zero
        x=A(i:i+1,i);
        [u,gamma,t]=reflect(x);
        gam(i)=gamma;
        % We only need to apply reflector matrix Q on two rows
        A(i:i+1,i+1:m)=applreflect(u,gamma,A(i:i+1,i+1:m));
        A(i:i+1,i)=u;
        A(i,i)=-t;
        % Computing Q, Q_hat*ek = Q1*Q2*......*Qk*ek
        % Q = [Q_hat*e1 Q_hat*e2 .... Q_hat*em]
        for j=i:-1:1
            gamma=gam(j);
            u=zeros(2,1);
            u(2) = A(j+1,j);
            u(1)=1;
            Q(j:j+1,i)=applreflect(u,gamma,Q(j:j+1,i));
        end
    end
    % Computing Q for the last column
    i=n;
    for j=m-1:-1:1
        gamma=gam(j);
        u=zeros(2,1);
        u(2) = A(j+1,j);
        u(1)=1;
        Q(j:j+1,i)=applreflect(u,gamma,Q(j:j+1,i));
    end
    R=triu(A);
end