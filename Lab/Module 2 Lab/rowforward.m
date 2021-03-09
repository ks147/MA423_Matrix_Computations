%Row-oriented forward substitution
%Solves a Lower triangular system of Equations
%L is a n X n matrix, b is n X 1 matrix
function b=rowforward(L,b)
    n=size(b,1);
    for k=1:n
        for j=1:k-1
           b(k)=b(k)-L(k,j)*b(j); 
        end
        if L(k,k)~=0
            b(k)=b(k)/L(k,k);
        end
    end
end