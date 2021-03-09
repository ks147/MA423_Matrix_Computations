%Question 1 part a
%n - no of rows/columns in the square matrix
function W=Wilkinson(n)
    I=eye(n);
    A=ones(n);
    %triu returns triangular upper matrix
    A=-(A-triu(A));
    W=A+I;
    W(:,n)=1;
end