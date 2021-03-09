function x=geppsolve(A,b)
    [L,U,p]=gepp(A);
    P=eye(size(A,1));
    P=P(p,:);
    b=P*b; % Apply permutation matrix to b as well
    y=rowforward(L,b);
    x=colbackward(U,y);
end