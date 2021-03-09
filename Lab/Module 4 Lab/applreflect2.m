function B = applreflect2(u,gamma,A)
    v = gamma.*u;
    w = A*v;
    C = w*u';
    B = A - C;
end