function x_c=iteref(A,b,x_c,L,U,p,m,tol)
    j=0;
    while(j<m)
        j=j+1;
        r=b-A*x_c;
        P=eye(size(A,1));
        P=P(p,:);
        yhat=rowforward(L,P*r);
        xhat=colbackward(U,yhat);
        xnew=x_c+xhat;
        x_c=xnew;
        if (norm(xhat,inf)/norm(x_c,inf)<tol)
            break;
        end
    end
end