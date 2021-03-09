%column-oriented backward substitution
%Solves a Upper triangular system of Equations
%U is a n X n matrix, b is n X 1 matrix
function b=colbackward(U,b)
    n=size(b,1);
    for j=n:-1:1
       if U(j,j)~=0
            b(j)=b(j)/U(j,j); 
       end
       b(1:j-1)=b(1:j-1)-U(1:j-1,j)*b(j);
    end
end
