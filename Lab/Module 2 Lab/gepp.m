%Gaussian Elimination With Partial Pivoting
function [L,U,p,sign]=gepp(A)
    n=size(A,1);
    p=(1:n)';
    sign=1;
    for k=1:n-1
       [~,j]=max(abs(A(k:n,k)));
       j=j+k-1;%A(k:n) is treated as a matrix and its jth row is (j+k-1)th row in A
       if (j~=k)
           sign=-sign;
           A([k,j],:)=A([j,k],:);
           p([k,j],:)=p([j,k],:);
       end
       if A(k,k)~=0
           A(k+1:n,k)=A(k+1:n,k)/A(k,k);
       else
           error("Zero pivot Encountered")
       end
       A(k+1:n,k+1:n)=A(k+1:n,k+1:n)-A(k+1:n,k)*A(k,k+1:n); 
    end
   L=eye(n)+tril(A,-1);
   U=triu(A);
end