function y = Horner(p,x)
    n = length(p);
    m = length(x);
    size(p)
    y = p(1)*ones(1,m);
    for i=2:n
        y = p(i) + y.*x;
    end
    
end