function X = myinv(A)   
    n = size(A,1);
    [L,U,p]=gepp(A);
    P=eye(size(A,1));
    P=P(p,:);
    y=zeros(n,n);
    for i=1:n
        y(:,i)=rowforward(L,P(:,i));
    end
    X=zeros(n,n);
    for i=1:n
        X(:,i)=colbackward(U,y(:,i));
    end
end