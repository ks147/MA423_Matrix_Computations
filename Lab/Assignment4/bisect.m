function x = bisect(p,x0,x1,tol)
    xmid = x0 + (x1 - x0)/2;
    while (Horner(p,x0)*Horner(p,x1) < 0 && Horner(p,xmid) > tol)
         if Horner(p,xmid)*Horner(p,x0) < 0 
             x1 = xmid;
         else
             x0 = xmid;
         end
         xmid = x0 + (x1 - x0)/2;
    end
    x = xmid;
end