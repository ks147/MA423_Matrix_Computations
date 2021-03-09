function G = mycholb(A)
    n = size(A,1);
    G = zeros(n,n);
    G(1,1) = sqrt(A(1,1));
    for j=2:n
        h = colbackward(G(1:j-1,1:j-1)',A(1:j-1,j));
        G(j,1:j-1) = h;
        G(j,j) = sqrt(A(j,j) - h'*h);
    end
end