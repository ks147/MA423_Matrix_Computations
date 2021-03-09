function [u,gamma,t]=reflect(x)
    sign=1;
    x1=x(1);
    if x1<0
        sign=-1;
    end
    t=sign*norm(x,2);
    y=zeros(size(x,1),1);
    y(1)=-t;
    u=(x-y)/(x1+t);
    gamma=(t+x1)/t;
end