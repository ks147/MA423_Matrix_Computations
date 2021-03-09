function [ B, k] = CallFrancisQR( A, m, tol)
    % check if A is upper Hessenberg or not
    [n1, n] = size(A);
    
    if n ~= n1
        error("A is not a square matrix\n");
    end
   
    for j=1:n
        for i=j+1:n
            if(i==j+1)
                if(A(i,j)==0)
                    error('Matrix is not proper Hessenberg')
                end
            else
                if(A(i,j)~=0)
                    error('Matrix is not proper Hessenberg')
                end                
            end
        end
    end    
    
    
    k = 0;
     if n==1
        B = A;
        return;
     end
     
    flag = false;
    if(m==1)
        while(~flag)
            k = k + 1;
            A = FrancisQRS(A);
            for i=1:n-1
                if(abs(A(i+1,i)) < tol)
                    flag = true;
                    break;
                end    
            end    
        end
    elseif(m==2)    
        while(~flag)
            k = k + 1;
            A = FrancisQRD(A);
            for i=1:n-1
                if(abs(A(i+1,i)) < tol)
                    flag = true;
                    break;
                end    
            end    
        end    
    end
    
    B = A;
end